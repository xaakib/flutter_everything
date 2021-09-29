import 'package:get/get.dart';

import '../sql_helper.dart';

class RoomSelectController extends GetxController {
  List  journals= [].obs;
    
     refreshJournals( List<Map<String, dynamic>> _journals ) async {
    final data = await SQLHelper.getItems();
  
      journals = data;

  }


}