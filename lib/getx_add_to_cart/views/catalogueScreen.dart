import 'package:flutter/material.dart';
import 'package:flutter_everything/getx_add_to_cart/model/productModel.dart';
import 'package:flutter_everything/getx_add_to_cart/viewmodel/addToCartVM.dart';
import 'package:flutter_everything/getx_add_to_cart/views/cart.dart';
import 'package:flutter_everything/getx_add_to_cart/views/widgets/cartCounter.dart';
import 'package:flutter_everything/getx_add_to_cart/views/widgets/productItem.dart';
import 'package:flutter_everything/login_auth_testing_api/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final prds = [
    {
      "name": "ABCD",
      "image":
          "https://images.unsplash.com/photo-1632685166377-bf74f440457f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
    },
    {
      "name": "QQWE",
      "image":
          "https://images.unsplash.com/photo-1632715444468-e562f195708c?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
    },
    {
      "name": "WWSA",
      "image":
          "https://images.unsplash.com/photo-1632611236498-baa21d21c45b?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
    },
    {
      "name": "EXMP",
      "image":
          "https://images.unsplash.com/photo-1632691013308-d1b25d3ff20f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
    },
    {
      "name": "SADS",
      "image":
          "https://images.unsplash.com/photo-1632674068040-8984582afdee?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
    },
  ];
  final AddToCartVM addToCartVM = Get.put(AddToCartVM());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.blue, size: 25)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GetBuilder<AddToCartVM>(
                      // specify type as Controller
                      init: AddToCartVM(), // intialize with the Controller
                      builder: (value) => CartCounter(
                        count: value.lst.length.toString() ?? "0",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prds.length,
                itemBuilder: (context, index) => ProductItem(
                  screenSize: screenSize,
                  image: prds[index]["image"],
                  itemName: prds[index]["name"],
                ),
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                addToCartVM.add(
                    "https://images.unsplash.com/photo-1632691013308-d1b25d3ff20f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                    "Shkaib");
              },
              child: Container(
                height: 40,
                child: Text("Add"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(LoginAuthApiScreen());
              },
              child: Container(
                height: 40,
                child: Text("Login Screen"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
