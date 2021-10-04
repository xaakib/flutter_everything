// import 'package:flutter/material.dart';
// import 'package:flutter_everything/getx_add_to_cart/viewmodel/addToCartVM.dart';
// import 'package:flutter_everything/getx_add_to_cart/views/cart.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';

// class CartDetailsScreen extends StatefulWidget {
//   CartDetailsScreen({Key key}) : super(key: key);

//   @override
//   _CartDetailsScreenState createState() => _CartDetailsScreenState();
// }

// class _CartDetailsScreenState extends State<CartDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     print("object");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: Center(
//           child: Column(
//             children: [
//               GetBuilder<AddToCartVM>(
//                   // specify type as Controller
//                   init: AddToCartVM(), // intialize with the Controller
//                   builder: (value) => InkWell(
//                       onTap: () {
//                         value.add("https://picsum.photos/250?image=9", "Test");
//                       },
//                       child: Text(
//                         "data",
//                         style: TextStyle(color: Colors.black),
//                       ))),
//               InkWell(
//                 onTap: (){
//                   Get.to(CartScreen());
//                 },
//                 child: Text("data"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
