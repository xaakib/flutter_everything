// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'model/user_model.dart';

// class ThirdScreen extends StatefulWidget {
//   const ThirdScreen({Key key}) : super(key: key);

//   @override
//   _ThirdScreenState createState() => _ThirdScreenState();
// }

// class _ThirdScreenState extends State<ThirdScreen> {
//   saveData({String name, String email, int age}) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     List<String> listData = [];
//     final testUser = UserModels(
//       name: name,
//       email: email,
//       age: age,
//     );

//     var jsonData = jsonEncode(testUser.toJson());
//     listData.add(jsonData);
//     sharedPreferences.setStringList("list", listData);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ThirdScreen"),
//       ),
//       body: Container(
//         height: double.infinity,
//         child: Column(
//           children: [
//             Center(
//               child: ElevatedButton(
//                 child: Text("Data2"),
//                 onPressed: () {
//                   saveData(
//                       name: "THired Screen",
//                       age: 21,
//                       email: "xaakibx@gmail.com");
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
