import 'package:flutter/material.dart';
import 'dart:convert';
import 'register_screen.dart';
import 'package:http/http.dart' as http;

class FmLoginScreen extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return loginUser();
    }
    return false;
  }

  loginUser() async {
    var loginData = jsonEncode(<String, String>{
      'username': userNameController.text,
      'password': passwordController.text
    });
    print(loginData);
    var res =
        await http.post(Uri.parse("https://test.iqbal.live/api/auth/login"),
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
        title: Text("Login"),
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
                    controller: userNameController,
                    keyboardType: TextInputType.emailAddress,
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
                  // ignore: deprecated_member_use
                  RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () {
                        // print(userNameController.text);
                        // print(passwordController.text);
                        _submit();
                      }),

                  SizedBox(height: 10),
                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: Text("Go TO Register"),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    FmRegisterScreen()));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
