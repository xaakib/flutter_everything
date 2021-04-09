import 'package:flutter/material.dart';

import 'famous_live_auth/screens/home_screen.dart';
import 'famous_live_auth/screens/login_screen.dart';
import 'famous_live_auth/screens/register_screen.dart';
import 'famous_live_auth/screens/testLogin.dart';
import 'famous_live_auth/screens/testRegister.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
