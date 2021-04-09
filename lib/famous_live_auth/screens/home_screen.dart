import 'package:flutter/material.dart';
import 'package:flutter_everything/famous_live_auth/screens/models/usersModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getString('token');
    return prefs.getString('token');
  }

  // Future<UserModel> getProfile() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token');
  //   String url = "https://test.iqbal.live/api/user/profile";
  //   print("Profile..>>>>$url");

  //   Map<String, String> requestHeaders = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'authorization': token
  //   };
  //   // String _token = await loadToken();
  //   print("PRofileTOken.. $token");
  //   var response = await http.get(Uri.parse(url), headers: requestHeaders);
  //   print('API ${response.statusCode}\n API${json.decode(response.body)}');
  //   if (response.statusCode == 200) {

  //        profile = response.body;

  //       return userModelFromJson(profile);

  //   } else {
  //     throw Exception("FAILED_MASSAGE");
  //   }
  // }

  Future<UserModel> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String url = "https://test.iqbal.live/api/user/profile";
    print("Profile..>>>>$url");

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer$token"
    };
    // String _token = await loadToken();
    print("PRofileTOken.. $token");
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    print('API ${response.statusCode}\n API${json.decode(response.body)}');
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      return jsonString;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getProfile();
    loadToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: FutureBuilder(
          future: getProfile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data;
              return Text(
                data["name"],
                style: TextStyle(color: Colors.black),
              );
            }
            return Center(child: Text("no data"));
          }),
    );
  }
}
