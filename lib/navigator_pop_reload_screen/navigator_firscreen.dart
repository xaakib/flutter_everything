import 'package:flutter/material.dart';
import 'package:flutter_everything/navigator_pop_reload_screen/navigator_secound_screen.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class NavigatorFirstScreen extends StatefulWidget {
  const NavigatorFirstScreen({Key? key}) : super(key: key);

  @override
  _NavigatorFirstScreenState createState() => _NavigatorFirstScreenState();
}

class _NavigatorFirstScreenState extends State<NavigatorFirstScreen> {
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    print("FirstScreen$color");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "First Screen",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Press to Next SRN"),
            onPressed: () async {
              final value = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NavigatorSecoundScreen()),
              );

              setState(() {
                color = color == Colors.white ? Colors.grey : Colors.white;
              });
            },
          ),
        ),
      ),
    );
  }
}
