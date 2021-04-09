
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FmRegisterScreen extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

 _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return registerUser();
    }
    return false;
  }


 
  
  registerUser() async {
    var loginData = jsonEncode(<String, String>{
      'name': nameController.text,
      'mobile': phoneController.text,
        'password': passwordController.text,
      'password_confirmation': confirmPassword.text,

    });
    var res =
        await http.post(Uri.parse("https://test.iqbal.live/api/auth/register"),
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: loginData);
    print(res.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            //form
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //styling
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                  ),

                  //styling
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.number,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                  ),
                  //box styling
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  //text input
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  //text input
                  TextFormField(
                    controller: confirmPassword,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {},
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () {
                        _submit();
                      }),
                  SizedBox(
                    height: 20,
                  ),

                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    child: Text(
                      "Back To Login",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                FmLoginScreen())),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
