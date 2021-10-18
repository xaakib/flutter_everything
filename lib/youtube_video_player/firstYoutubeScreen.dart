import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstYoutubeScreen extends StatefulWidget {
  const FirstYoutubeScreen({Key? key}) : super(key: key);

  @override
  _FirstYoutubeScreenState createState() => _FirstYoutubeScreenState();
}

class _FirstYoutubeScreenState extends State<FirstYoutubeScreen> {
  late String videoId;
  getYoutubeConvert() {
    setState(() {
      videoId = YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=8n0M3HQ3dbo")!;
    });
  }

  late YoutubePlayerController _controller;

  // ignore: unused_field
  late PlayerState _playerState;
  // ignore: unused_field
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    getYoutubeConvert();
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late String name;
  var value = "";
  var value2 = 'red';

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) => Scaffold(
          appBar: AppBar(
            title: Text("data"),
          ),
          body: value == ""
              ? Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(height: 200, child: player),
                      value2 == "red"
                          ? Container(
                              height: 400,
                              color: Colors.red,
                            )
                          : Container(
                              height: 400,
                              color: Colors.green,
                            ),
                    ],
                  ))
              : Text("data")
          // if (value == null) ...[

          // ] else ...[
          //   Text("value not null")
          // ]
          ),
    );
  }
}
