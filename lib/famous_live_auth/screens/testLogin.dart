import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestLogin extends StatefulWidget {
  @override
  _TestLoginState createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.network(
                      "https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        loginApi();
                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue, width: 2)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future loginApi() async {

    var res = await http.post(
        Uri.parse("https://test.iqbal.live/api/auth/login"),
        headers: <String, String>{
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: <String, String>{
          'username': name.text,
          'password': password.text,
        });
    print(res.body);
  }
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 1.5,
      ),
    ),
  );
}
