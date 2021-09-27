import 'package:flutter/material.dart';
import 'package:flutter_everything/getx_add_to_cart/viewmodel/addToCartVM.dart';
import 'package:flutter_everything/getx_add_to_cart/views/widgets/cartItem.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetBuilder<AddToCartVM>(
      // specify type as Controller
      init: AddToCartVM(), // intialize with the Controller
      builder: (value) => Scaffold(
        body: SafeArea(
          child: Container(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length ?? 0,
              itemBuilder: (context, index) {
                print(value.lst[index].toJson());
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    image: value.lst[index].image,
                    itemName: value.lst[index].name,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
