import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:neon_chat/src/chat_init.dart';
import 'package:photo_view/photo_view.dart';

class ChatMediaViewerLoader extends StatelessWidget {
  final String title;
  final ConversationMessage message;
  final ConversationBloc convoBloc;
  const ChatMediaViewerLoader({
    Key? key,
    required this.title,
    required this.message,
    required this.convoBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => chatGetIt<UploadUrlCubit>(),
          ),
          BlocProvider.value(
            value: convoBloc,
          ),
        ],
        child: _ChatMediaViewerPage(
          title: title,
          currentMediaMessage: message,
        ));
  }
}

class _ChatMediaViewerPage extends StatefulWidget {
  const _ChatMediaViewerPage({
    Key? key,
    required this.currentMediaMessage,
    required this.title,
  }) : super(key: key);
  final ConversationMessage currentMediaMessage;
  final String title;

  @override
  _ChatMediaViewerPageState createState() => _ChatMediaViewerPageState();
}

class _ChatMediaViewerPageState extends State<_ChatMediaViewerPage> {
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

    final headers =
        chatGetIt<Map<String, String>>(instanceName: kHttpHeadersInstanceName);

    if (kIsWeb) {
      return Container(
        color: chatGetIt<ConversationStyle>().backgroundColor,
        alignment: Alignment.center,
        child: Image.network(
          imageUrl,
          headers: headers,
        ),
      );
    }

    return PhotoView(
      imageProvider: CachedNetworkImageProvider(imageUrl, headers: headers),
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
                onTap: () => context.router.pop(),
              )
            : null,
        backgroundColor: chatGetIt<ConversationStyle>().backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.title,
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

class ChatMediaViewerRoute extends PageRouteInfo<ChatMediaViewerRouteArgs> {
  ChatMediaViewerRoute(
      {Key? key,
      required String title,
      required ConversationMessage message,
      required ConversationBloc convoBloc})
      : super(ChatMediaViewerRoute.name,
            path: '/chat-media-viewer-page',
            args: ChatMediaViewerRouteArgs(
              title: title,
              message: message,
              convoBloc: convoBloc,
            ));

  static const String name = 'ChatMediaViewerRoute';
}

class ChatMediaViewerRouteArgs {
  const ChatMediaViewerRouteArgs({
    this.key,
    required this.title,
    required this.message,
    required this.convoBloc,
  });

  final Key? key;

  final String title;
  final ConversationMessage message;
  final ConversationBloc convoBloc;

  @override
  String toString() {
    return 'ChatMediaViewerRouteArgs{key: $key, title: $title, message: $message, convoBloc: $convoBloc}';
  }
}
