import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_add_to_cart/views/catalogueScreen.dart';
import 'multiple_index_select.dart/multiple_index_slection.dart';

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
        home: ProductScreen());
  }
}
