import 'package:flutter/material.dart';

class Soucentscreen extends StatelessWidget {
  final userModel;

  const Soucentscreen({Key? key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "this is the user name ${userModel.name}, and is was ${userModel.id} , and the job title is ${userModel.job} and create time date is ${userModel.createdAt}"),
          ),
        ),
      ),
    );
  }
}
