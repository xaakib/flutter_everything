import 'package:flutter/material.dart';
import 'package:flutter_everything/photo_filter/photo_filter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/screens/main_screen.dart';
import 'agora_project/screen.dart/agora_home.dart';
import 'api_error_handleing/screens/error_homeScreen.dart';
import 'famous_live_auth/screens/home_screen.dart';
import 'famous_live_auth/screens/testLogin.dart';
import 'photo_filter/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var token;
  void isLoogedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    setState(() {});
    print(token);
  }

  @override
  void initState() {
    super.initState();
    isLoogedIn();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: token==null ? LoginScreen() : HomePage()
      //
      home: ImagePckerScreen(),
    );
  }
}
