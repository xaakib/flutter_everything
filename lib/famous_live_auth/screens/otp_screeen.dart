import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verify"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
