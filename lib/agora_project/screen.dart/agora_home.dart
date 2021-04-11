// import 'package:flutter/material.dart';

// class AgoraHoome extends StatefulWidget {
//   @override
//   _AgoraHoomeState createState() => _AgoraHoomeState();
// }

// class _AgoraHoomeState extends State<AgoraHoome> {
//   // final _DATA = [...Basic, ...Advanced];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('APIExample'),
//         ),
//         body: ListView.builder(
//           itemCount: _DATA.length,
//           itemBuilder: (context, index) {
//             return _DATA[index]['widget'] == null
//                 ? Ink(
//                     color: Colors.grey,
//                     child: ListTile(
//                       title: Text(_DATA[index]['name'],
//                           style: TextStyle(fontSize: 24, color: Colors.white)),
//                     ),
//                   )
//                 : ListTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Scaffold(
//                                     appBar: AppBar(
//                                       title: Text(_DATA[index]['name']),
//                                     ),
//                                     body: _DATA[index]['widget'],
//                                   )));
//                     },
//                     title: Text(
//                       _DATA[index]['name'],
//                       style: TextStyle(fontSize: 24, color: Colors.black),
//                     ),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
