import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_everything/youtube_video_player/firstYoutubeScreen.dart';
import 'package:get/get.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  @override
  _YoutubeVideoPlayerState createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              child: Text("CLick"),
              onPressed: () {
                Get.to(FirstYoutubeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
