import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://d27oc5w9vm64lf.cloudfront.net/tungi_parar_mia_vai/tungi_parar_mia_vai.m3u8");
    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          expandToFill: true,
          autoDispose: true,
          fullScreenByDefault: true,
          autoPlay: true, fit: BoxFit.fill),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BetterPlayer(
                  controller: _betterPlayerController,
                ),
              ),
              Text("Video Played")
            ],
          ),
        ));
  }
}
