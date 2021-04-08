import 'package:flutter/material.dart';

import 'register_screen.dart';

class FmLoginScreen extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
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
                    onPressed: () => _submit(),
                  ),
                  SizedBox(height: 10),
                  // ignore: deprecated_member_use
                 RaisedButton(
                   child: Text("Go TO Register"),
                   onPressed: (){
                     Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => FmRegisterScreen()));
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
