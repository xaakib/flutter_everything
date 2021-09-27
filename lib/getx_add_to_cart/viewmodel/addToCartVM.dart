import 'package:flutter_everything/getx_add_to_cart/model/productModel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddToCartVM extends GetxController {
  List<Products> lst = <Products>[];

  add(String image, String name) {
    lst.add(Products(image: image, name: name));
    update();
  }

  del(int index) {
    lst.removeAt(index);
    update();
  }
}
