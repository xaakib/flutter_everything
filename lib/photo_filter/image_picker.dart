import 'package:flutter/material.dart';

class ImagePckerScreen extends StatefulWidget {
  @override
  _ImagePckerScreenState createState() => _ImagePckerScreenState();
}

class _ImagePckerScreenState extends State<ImagePckerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Container(
        color: Colors.red[400],
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 50),
            Stack(
              children: [
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
