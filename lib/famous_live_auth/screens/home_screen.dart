import 'package:flutter/material.dart';
import 'package:flutter_everything/famous_live_auth/screens/models/usersModel.dart';
import 'package:flutter_everything/famous_live_auth/screens/testLogin.dart';
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
  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('token');
    return prefs.remove('token');
  }

  Future<UserModel> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String url = "https://test.iqbal.live/api/user/profile";
    print("Profile..>>>>$url");

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };
    // String _token = await loadToken();
    print("PRofileTOken.. $token");
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    print('API ${response.statusCode}\n API${json.decode(response.body)}');
    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body);

      UserModel userData = UserModel.fromJson(jsonString);
      print("this the user name ${userData.data.name}");
      print("this the user name ${userData.data.id}");
      return userData;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getProfile();
    loadToken();
  }

  UserModel usermode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(
            icon: Icon(Icons.login_outlined),
            onPressed: () {
             logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: FutureBuilder<UserModel>(
                future: getProfile(),
                builder: (context, AsyncSnapshot<UserModel> snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(snapshot.data.data.name),
                      subtitle: Text(snapshot.data.data.mobile),
                      trailing: Text(snapshot.data.data.username),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
