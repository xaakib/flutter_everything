import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_everything/shearprefernce/model/user_model.dart';
import 'package:flutter_everything/shearprefernce/secoundScreen.dart';
import 'package:flutter_everything/shearprefernce/thiredScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  SharedPreferencesDemo({Key key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List listData = sharedPreferences.getStringList('list');
    print("listData Get : $listData");
  }

  saveData({String name, String email, int age}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> listData = [];
    final testUser = UserModels(
      name: name,
      email: email,
      age: age,
    );

    var jsonData = jsonEncode(testUser.toJson());
    listData.add(jsonData);
    sharedPreferences.setStringList("list", listData);
  }

  clearData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SharedPreferences Demo"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: Text("GoTO THirdscreen"),
                  onPressed: () {
                    Get.to(ThirdScreen());
                   
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text("Data2"),
                  onPressed: () {
                    saveData(
                        name: "save 2", age: 21, email: "xaakibx@gmail.com");
                  },
                ),
              ),
              ElevatedButton(
                child: Text("NextScreen"),
                onPressed: () {
                  Get.to(SecoundScrenShearPref());
                },
              ),
            ],
          ),
        ));
  }
}
