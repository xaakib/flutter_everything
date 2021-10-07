import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_everything/videoPlayerScreen/playerscreen.dart';
import 'package:flutter_everything/youtube_video_player/firstYoutubeScreen.dart';
import 'package:get/get.dart';

class GOToVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(VideoPlayerScreen());
              },
              child: Text("Play Video"),
            ),
            Text("data")
          ],
        ));
  }
}
