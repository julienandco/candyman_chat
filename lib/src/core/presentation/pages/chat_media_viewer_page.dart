import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:photo_view/photo_view.dart';

class ChatMediaViewerPage extends StatefulWidget {
  const ChatMediaViewerPage({
    Key? key,
    required this.currentMediaMessage,
  }) : super(key: key);
  final ConversationMessage currentMediaMessage;

  @override
  _ChatMediaViewerPageState createState() => _ChatMediaViewerPageState();
}

class _ChatMediaViewerPageState extends State<ChatMediaViewerPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  List<ConversationMessage> messages = [];
  @override
  void initState() {
    messages = context.read<ConversationBloc>().state.getMediaMessages();
    _currentIndex = messages.indexOf(widget.currentMediaMessage);
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  Widget _getImageWidget(String fileId) {
    final url = chatGetIt<NeonChatRemoteDataSource>().remoteUploadsURL;
    final imageUrl = '$url/$fileId';

    if (kIsWeb) {
      return Container(
        color: chatGetIt<ConversationStyle>().backgroundColor,
        alignment: Alignment.center,
        child: Image.network(imageUrl),
      );
    }

    return PhotoView(
      imageProvider: CachedNetworkImageProvider(imageUrl),
      minScale: PhotoViewComputedScale.contained,
    );
  }

  Widget _itemBody(int index) {
    switch (messages[index].type) {
      case ConversationMessageType.image:
        return _getImageWidget(messages[index].upload!.fileId);

      case ConversationMessageType.video:
        if (kIsWeb) {
          return ChatVideoPageWeb(
            message: messages[index],
            getUploadURL: (id) =>
                '${chatGetIt<NeonChatRemoteDataSource>().remoteUploadsURL}/$id',
          );
        }
        return ChatVideoPage(
          message: messages[index],
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatGetIt<ConversationStyle>().backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: chatGetIt<ConversationStyle>().appBarOnPopIcon != null
            ? GestureDetector(
                child: chatGetIt<ConversationStyle>().appBarOnPopIcon,
                onTap: () => Navigator.of(context).pop(),
              )
            : null,
        backgroundColor: chatGetIt<ConversationStyle>().backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              context.read<ConversationBloc>().state.maybeMap(
                    loadSuccess: (state) => messages[_currentIndex].isMe
                        ? chatGetIt<ConversationStyle>().youString
                        : state.conversation.conversationMembers
                            .firstWhere(
                              (member) =>
                                  member.id == messages[_currentIndex].senderId,
                              orElse: () => FirebaseUser(id: '', username: ''),
                            )
                            .username,
                    orElse: () => '',
                  ),
              style: chatGetIt<MessageBubbleStyle>().ownMessageTextStyle,
            ),
            Text(
              messages[_currentIndex].timestampFormatted,
              style: chatGetIt<MessageBubbleStyle>().ownMessageTimestampStyle,
            ),
          ],
        ),
      ),
      body: PageView.builder(
        onPageChanged: (value) => setState(() => _currentIndex = value),
        controller: _pageController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Scaffold(
            body: _itemBody(index),
          );
        },
      ),
    );
  }
}
