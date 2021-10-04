import 'package:flutter/material.dart';
import 'package:flutter_everything/shearprefernce/shearPreferance_demo.dart';
import 'package:flutter_everything/youtube_video_player/firstYoutubeScreen.dart';
import 'package:get/get.dart';
import 'getx_add_to_cart/views/catalogueScreen.dart';
import 'sqlite_crud/sqlite_crud_screen.dart';
import 'youtube_video_player/youtube_video_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
        ),
        // home: token==null ? LoginScreen() : HomePage()
        //
        home: FirstYoutubeScreen());
  }
}
