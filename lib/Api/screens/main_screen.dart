// import 'package:flutter/material.dart';
// import 'package:flutter_everything/Api/models/testModeldata.dart';
// import 'package:flutter_everything/Api/service/api_service.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   ApiServices apiServices = ApiServices();
//   TestData testData;
//   initData() async {
//     testData = await apiServices.testDatas();
//   }

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       initData();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: testData.allLocation != null
//             ? ListView(
//                 children: [
//                   Container(
//                     height: 500,
//                     child: testData.frontHotel != null
//                         ? ListView.builder(
//                             itemCount: testData.frontHotel.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                   title: Text(testData
//                                       .frontHotel[index].location
//                                       .toString()),
//                                   subtitle: Text(
//                                     testData.frontHotel[index].basicprice
//                                         .toString(),
//                                   ));
//                             })
//                         : Center(child: CircularProgressIndicator()),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Container(
//                     height: 500,
//                     child: testData.allLocation != null
//                         ? ListView.builder(
//                             itemCount: testData.allLocation.length,
//                             itemBuilder: (context, index) {
//                               return ListTile(
//                                   title: Text(testData
//                                       .allLocation[index].location
//                                       .toString()),
//                                   subtitle: Text(
//                                     testData.allLocation[index].country
//                                         .toString(),
//                                   ));
//                             })
//                         : Center(child: CircularProgressIndicator()),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                 ],
//               )
//             : Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
