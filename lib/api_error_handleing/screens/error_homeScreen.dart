import 'package:flutter/material.dart';
import 'package:flutter_everything/api_error_handleing/models/user_model.dart';
import 'package:flutter_everything/api_error_handleing/screens/secountCsreen.dart';
import 'package:http/http.dart' as http;

class ErrHomeScreen extends StatefulWidget {
  @override
  _ErrHomeScreenState createState() => _ErrHomeScreenState();
}

// ignore: missing_return
Future<UserModel> createUser(String name, String job) async {
  final String apiUrl = "https://reqres.in/api/users";

  final response = await http.post(Uri.parse(apiUrl), body: {
    "name": name,
    "job": job,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    print("No database COnnected");
  }
}

class _ErrHomeScreenState extends State<ErrHomeScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

  UserModel _userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error Handle"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: nameController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "name",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: jobController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: "job",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 50),
            // ignore: deprecated_member_use
            FlatButton(
                color: Colors.red,
                onPressed: () async {
                  final String name = nameController.text;
                  final String job = jobController.text;
                  final UserModel userMod = await createUser(name, job);
                  setState(() {
                    _userModel = userMod;
                  });
                  print(_userModel.id.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Soucentscreen(
                                userModel: _userModel,
                              )));
                },
                child: Text("Post")),
          ],
        ),
      ),
    );
  }
}
