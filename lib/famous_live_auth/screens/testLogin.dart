// import 'package:flutter/material.dart';
// import 'package:flutter_everything/famous_live_auth/screens/home_screen.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class TestLogin extends StatefulWidget {
//   @override
//   _TestLoginState createState() => _TestLoginState();
// }

// class _TestLoginState extends State<TestLogin> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   Future saveToken(String value) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString("token", value);

//     setState(() {
//       saveToken(value);
//     });
//     print(saveToken(value));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 70,
//                   child: Image.network(
//                       "https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: name,
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.person, "Full Name"),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please Enter Name';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: password,
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.lock, "Password"),
//                     validator: (String value) {
//                       if (value.isEmpty) {
//                         return 'Please a Enter Password';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   // ignore: deprecated_member_use
//                   child: RaisedButton(
//                     color: Colors.redAccent,
//                     onPressed: () {
//                       if (_formkey.currentState.validate()) {
//                         loginApi().then((value) async {
//                           SharedPreferences sharedPreferences =
//                               await SharedPreferences.getInstance();
//                           sharedPreferences.setString("token", value);

//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()));
//                         });
//                         return;
//                       } else {
//                         print("UnSuccessfull");
//                       }
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         side: BorderSide(color: Colors.blue, width: 2)),
//                     textColor: Colors.white,
//                     child: Text("Submit"),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future loginApi() async {
//     var res = await http.post(
//         Uri.parse("https://test.iqbal.live/api/auth/login"),
//         headers: <String, String>{
//           "Content-Type": "application/x-www-form-urlencoded",
//         },
//         body: <String, String>{
//           'username': name.text,
//           'password': password.text,
//         });
//     print(res.body);
//   }
// }

// InputDecoration buildInputDecoration(IconData icons, String hinttext) {
//   return InputDecoration(
//     hintText: hinttext,
//     prefixIcon: Icon(icons),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(25.0),
//       borderSide: BorderSide(color: Colors.green, width: 1.5),
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(25.0),
//       borderSide: BorderSide(
//         color: Colors.blue,
//         width: 1.5,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(25.0),
//       borderSide: BorderSide(
//         color: Colors.blue,
//         width: 1.5,
//       ),
//     ),
//   );
// }

import 'dart:convert';
import 'package:flutter_everything/PhoneOTP/screens/home_screen.dart';
import 'package:flutter_everything/famous_live_auth/screens/home_screen.dart';
import 'package:flutter_everything/famous_live_auth/screens/models/login_model.dart';
import 'package:flutter_everything/famous_live_auth/screens/testRegister.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/login_request.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class LoginResData {
  String type;
  LoginModel loginResponse;

  LoginResData(this.type, this.loginResponse);
}

class _LoginScreenState extends State<LoginScreen> {
  LoginModel loginResponse;

  final emailController = TextEditingController();
  final passcontroller = TextEditingController();
  bool isLoading = false;
  bool _showPassword = false;
  final _key = GlobalKey<FormState>();
  String email, password;
  LoginRequestModel loginRequestModel;
  bool status;
  String errorMessage;

  //bool isLoading = false;
  bool isSuccess;

  //<---------------------------Save Token
  Future saveToken(value) async {
    // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', value);
    print("this is the tokem$prefs");

    return prefs.setString("token", value);
  }

  Future<LoginResData> login(LoginRequestModel requestModel) async {
    LoginResData loginResData;
    String url = "https://test.iqbal.live/api/auth/login";
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      print('API ${response.statusCode}\n API${json.decode(response.body)}');

      // return LoginResponseModel.fromJson();
      loginResponse = LoginModel.fromJson(json.decode(response.body));
      print('Login response ${loginResponse.status}');
      errorMessage = json.decode(response.body)['message'];
      print('status ${loginResponse.status}');

      if (loginResponse.status == "Success") {
        loginResData = LoginResData("Success", loginResponse);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        print("Error = $errorMessage");

        loginResData = LoginResData("500", loginResponse);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
    return loginResData;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // ignore: unused_field
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    emailController.clear();
    passcontroller.clear();
    loginRequestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        ),
      ),
      body: isLoading
          ? Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 15),
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          //  autovalidate: true,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your email';
                            }

                            return null;
                          },
                          onChanged: (numVal) {
                            loginRequestModel.email = numVal;
                            setState(() {
                              email = numVal.trim();
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Email", border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          //   autovalidate: true,
                          controller: passcontroller,
                          onChanged: (numVal) {
                            loginRequestModel.password = numVal;

                            setState(() {
                              password = numVal.trim();
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ('Enter your valid password');
                            }
                            return null;
                          },
                          obscureText: !_showPassword,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(_showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: "Password",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, right: 28, top: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            height: 50,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                color: Colors.lightBlue,
                                onPressed: () {
                                  setState(() {
                                    if (_key.currentState.validate()) {
                                      login(loginRequestModel)
                                          .then((value) async {
                                        if (value != null) {
                                          if (value.type == 'Success') {
                                            saveToken(
                                                value.loginResponse.data.token);
                                            SharedPreferences sharedPref =
                                                await SharedPreferences
                                                    .getInstance();

                                            sharedPref.setString('token',
                                                value.loginResponse.data.token);
                                            setState(() {
                                              isLoading = false;
                                            });
                                            Fluttertoast.showToast(
                                                msg: ('Login Successfully'),
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 2,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.red,
                                                fontSize: 16.0);

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        HomePage()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: errorMessage,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 4,
                                                backgroundColor: Colors.black,
                                                textColor: Colors.red,
                                                fontSize: 20.0);
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Fluttertoast.showToast(
                                              msg: "Something went wrong!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.red,
                                              fontSize: 20.0);
                                        }
                                        Navigator.of(context);

                                        setState(() {});
                                      });
                                    } else {
                                      setState(() {
                                        _autoValidate = true;
                                      });
                                    }
                                  });
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Text(
                                  "Forgot password?",
                                  style: TextStyle(fontSize: 17),
                                ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Need an account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Text(
                                  " Register",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.blue),
                                ))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
