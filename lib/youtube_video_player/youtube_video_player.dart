// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

// class YoutubeVideoPlayer extends StatefulWidget {
//   const YoutubeVideoPlayer({Key key}) : super(key: key);

//   @override
//   _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
// }

// class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
//   YoutubePlayerController _controller;
//   String urlVideoFromYouTube = 'v0RWej7Sqg4'; //this is the last part of the YouTube url https://www.youtube.com/watch?v=v0RWej7Sqg4 copy-pasted by me

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: urlVideoFromYouTube,
//       params: const YoutubePlayerParams(
//         playlist: [
//           'nPt8bK2gbaU',//Default playlist
//           'K18cpp_-gP8',
//           'iLnmTe5Q2Qw',
//           '_WoCV4c6XOE',
//           'KmzdUe0RSJo',
//           '6jZDSSZZxjQ',
//           'p2lYr3vM_1w',
//           '7QUtEmBT_-w',
//           '34_PXCzGw1M',
//         ],
//         startAt: const Duration(minutes: 1, seconds: 36),
//         showControls: true,
//         showFullscreenButton: true,
//         desktopMode: true,
//         privacyEnhanced: true,
//         useHybridComposition: true,
//       ),
//     );
//     _controller.onEnterFullscreen = () {
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//       print('Entered Fullscreen');
//     };
//     _controller.onExitFullscreen = () {
//       print('Exited Fullscreen');
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     const player = YoutubePlayerIFrame();
//     return YoutubePlayerControllerProvider(
//       // Passing controller to widgets below.
//       controller: _controller,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Youtube Player IFrame'),
//         ),
//         body: Column(
//           children: [
//             LayoutBuilder(
//               builder: (context, constraints) {
                
//                   return  Expanded(child: player);
                
                
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.close();
//     super.dispose();
//   }
// }

// ///
// class Controls extends StatelessWidget {
//   ///
//   const Controls();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // _space,
//           // MetaDataSection(),
//           // _space,
//           // SourceInputSection(),
//           // _space,
//           // PlayPauseButtonBar(),
//           // _space,
//           // VolumeSlider(),
//           // _space,
//           // PlayerStateSection(),
//         ],
//       ),
//     );
//   }

//   Widget get _space => const SizedBox(height: 10);
// }