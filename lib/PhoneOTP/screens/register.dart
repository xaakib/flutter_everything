// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_everything/PhoneOTP/screens/home_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();

//   void sendOTP() async {
//     EmailAuth.sessionName = "Test Session";

//     var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
//     if (res) {
//       print("OTP Sent");
//     } else {
//       print("we could not sent the OTP");
//     }
//   }

//   void verifyOTP() {
//     var res = EmailAuth.validate(
//         receiverMail: _emailController.text, userOTP: _otpController.text);

//     if (res) {
//       res == null
//           ? print("No Data")
//           : Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) => HomeScreen()));
//       print("OTP Verifyed");
//     } else {
//       print("invalid OTP");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Register"),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         color: Colors.blue,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 height: 300,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                           border: UnderlineInputBorder(), labelText: 'Email'),
//                     ),

//                     SizedBox(
//                       height: 10,
//                     ),
//                     // ignore: deprecated_member_use
//                     FlatButton(
//                       color: Colors.red,
//                       onPressed: () => sendOTP(),
//                       child: Text(
//                         "Send OTp",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       controller: _otpController,
//                       decoration: InputDecoration(
//                           border: UnderlineInputBorder(),
//                           labelText: 'OTP CODE'),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     // ignore: deprecated_member_use
//                     FlatButton(
//                         color: Colors.blue,
//                         onPressed: () => verifyOTP(),
//                         child: Text("Send")),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
