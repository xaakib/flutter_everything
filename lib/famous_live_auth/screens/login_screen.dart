import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
      ),
    );
  }
}
