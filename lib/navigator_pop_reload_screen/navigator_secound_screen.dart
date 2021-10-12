import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorSecoundScreen extends StatefulWidget {
  const NavigatorSecoundScreen({Key? key}) : super(key: key);

  @override
  _NavigatorSecoundScreenState createState() => _NavigatorSecoundScreenState();
}

class _NavigatorSecoundScreenState extends State<NavigatorSecoundScreen> {
  @override
  Widget build(BuildContext context) {
    print("Secound Screen");
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Secound Screen"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            child: Text("Back TO FSRN"),
            onPressed: () {
              Navigator.pop(context,Colors.pink);
            },
          ),
        ),
      ),
    );
  }
}
