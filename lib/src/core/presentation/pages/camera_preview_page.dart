//TODO:needed?

// import 'dart:io';
// import 'dart:typed_data';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:papeo_app/core/domain/entities/media.dart';
// import 'package:papeo_app/core/presentation/widgets/buttons/action_button.dart';
// import 'package:papeo_app/core/style/padding_constants.dart';
// import 'package:papeo_app/features/chat/presentation/widgets/chat_circle_button.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:video_player/video_player.dart';

// enum MediaType { image, video }

// class CameraPreviewPage extends StatefulWidget {
//   final MediaType mediaType;
//   final Uint8List mediaData;

//   CameraPreviewPage({
//     required this.mediaType,
//     required this.mediaData,
//   });

//   @override
//   _CameraPreviewPageState createState() => _CameraPreviewPageState();
// }

// class _CameraPreviewPageState extends State<CameraPreviewPage> {
//   VideoPlayerController? _videoPlayerController;
//   ChewieController? _chewieController;
//   bool _videoIsReady = false;
//   File? _tempVideoFile;

//   @override
//   void initState() {
//     if (widget.mediaType == MediaType.video) {
//       _initializeVideo();
//     }
//     super.initState();
//   }

//   _initializeVideo() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = documentsDirectory.path + '/' + '${const Uuid().v4()}.mp4';
//     _tempVideoFile = await File(path).writeAsBytes(widget.mediaData.toList());
//     _videoPlayerController = VideoPlayerController.file(_tempVideoFile!);

//     await _videoPlayerController?.initialize().then((value) {
//       Future.delayed(const Duration(seconds: 1), () {
//         setState(() {});
//       });
//     });

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController!,
//       autoPlay: false,
//       looping: false,
//       aspectRatio: _videoPlayerController!.value.aspectRatio,
//       showControlsOnInitialize: false,
//       allowPlaybackSpeedChanging: false,
//     );
//     setState(() {
//       _videoIsReady = true;
//     });
//   }

//   @override
//   void dispose() {
//     _chewieController?.dispose();
//     _videoPlayerController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(5),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(25.0),
//                   child: widget.mediaType == MediaType.image
//                       ? Image.memory(widget.mediaData)
//                       : _getVideoView(context),
//                 ),
//               ),
//               Row(
//                 children: [
//                   ActionButton(
//                     buttonType: 2,
//                     title: 'cancel'.tr(),
//                     fillColor: Colors.transparent,
//                     onPressed: () {
//                       Navigator.of(context).pop<bool>(false);
//                     },
//                   ),
//                   const Spacer(),
//                   ChatCircleButton(
//                     child:
//                         SvgPicture.asset('assets/vectors/sendMessageIcon.svg'),
//                     size: 46,
//                     onTap: () {
//                       Navigator.of(context).pop<bool>(true);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getVideoView(BuildContext context) {
//     if (_videoIsReady) {
//       return AspectRatio(
//         aspectRatio: _videoPlayerController!.value.aspectRatio,
//         child: Chewie(
//           controller: _chewieController!,
//         ),
//       );
//     }
//     return Container();
//   }
// }
