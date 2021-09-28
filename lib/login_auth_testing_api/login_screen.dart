import 'package:flutter/material.dart';
import 'package:flutter_everything/getx_add_to_cart/views/catalogueScreen.dart';
import 'package:get/get.dart';

class LoginAuthApiScreen extends StatefulWidget {
  @override
  _LoginAuthApiScreenState createState() => _LoginAuthApiScreenState();
}

class _LoginAuthApiScreenState extends State<LoginAuthApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.infinity,
      child: Center(
        child: InkWell(
                onTap: () {
                  Get.to(ProductScreen());
                },
                child: Container(
                  height: 40,
                  child: Text("Login Screen"),
                ),
              ),
      ),),
    );
  }
}
