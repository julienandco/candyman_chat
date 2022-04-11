import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_chat/neon_chat.dart';
import 'package:photo_view/photo_view.dart';

class ChatMediaViewerPage extends StatefulWidget {
  const ChatMediaViewerPage({
    Key? key,
    required this.currentMediaMessage,
  }) : super(key: key);
  final ConversationMessage currentMediaMessage;

  // static CupertinoPageRoute route(
  //   BuildContext context, {
  //   required ChatMessageModel currentMediaMessage,
  // }) =>
  //     CupertinoPageRoute(
  //       fullscreenDialog: true,
  //       builder: (_) => BlocProvider.value(
  //         value: context.read<ChatBloc>(),
  //         child: ChatMediaViewerPage(
  //           currentMediaMessage: currentMediaMessage,
  //         ),
  //       ),
  //     );
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
    return FutureBuilder(
      future: context.read<UploadUrlCubit>().getUploadURL(fileId),
      // getIt<GetUploadRedirectUrlForUrlUC>().call('$kRemoteUploadsUrl/$url'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          String s3Url = snapshot.data;
          s3Url = s3Url.replaceAll('https://', 'http://');
          if (kIsWeb) {
            return Container(
              color: Colors.red, //TODO
              alignment: Alignment.center,
              child: Image.network(s3Url),
            );
          }
          print('S3URL');
          print(s3Url);
          return PhotoView(
            imageProvider: CachedNetworkImageProvider(s3Url),
            minScale: PhotoViewComputedScale.contained,
          );
        } else {
          return Container(
            color: Colors.black, //TODO
          );
        }
      },
    );
  }

  Widget _itemBody(int index) {
    switch (messages[index].type) {
      case ConversationMessageType.image:
        return _getImageWidget(messages[index].upload!.fileId);

      case ConversationMessageType.video:
        if (kIsWeb) {
          // return ChatVideoPageWeb(
          //   message: messages[index],
          // );
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
      backgroundColor: Colors.blue, //TODO
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: kColorPrimary,
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      //   centerTitle: true,
      //   title: Column(
      //     children: [
      //       Text(
      //         context.read<ChatBloc>().state.maybeMap(
      //               loadSuccess: (state) => messages[_currentIndex].isMe
      //                   ? 'You'.tr()
      //                   : state.userProfile.name,
      //               orElse: () => '',
      //             ),
      //         style: TextStyle(
      //           fontFamily: kFontFamilySFPro,
      //           color: kColorWhite,
      //           fontSize: 17,
      //         ),
      //       ),
      //       Text(
      //         DateFormat('dd.MM.yy, HH:mm')
      //             .format(messages[_currentIndex].timestamp ?? DateTime.now()),
      //         style: TextStyle(
      //           fontFamily: kFontFamilySFPro,
      //           color: kColorWhite,
      //           fontSize: 11,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
