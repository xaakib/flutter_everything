import 'package:flutter/material.dart';

class ErrHomeScreen extends StatefulWidget {
  @override
  _ErrHomeScreenState createState() => _ErrHomeScreenState();
}



class _ErrHomeScreenState extends State<ErrHomeScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController jobController = TextEditingController();

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
            FlatButton(
                color: Colors.red, onPressed: () {}, child: Text("Post")),
          ],
        ),
      ),
    );
  }
}
