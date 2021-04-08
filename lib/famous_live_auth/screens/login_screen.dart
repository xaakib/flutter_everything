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
        title: Text("Form Validation"),
        leading: Icon(Icons.filter_vintage),
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //form
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Form-Validation In Flutter ",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              //styling
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
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
                  "Submit",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () => _submit(),
              ),
              SizedBox(height: 10),
              // ignore: deprecated_member_use
             RaisedButton(
               child: Text("Data PAss"),
               onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
