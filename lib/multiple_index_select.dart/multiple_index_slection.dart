import 'package:flutter/material.dart';

class MultipleIndexSelection extends StatefulWidget {
  @override
  _MultipleIndexSelectionState createState() => _MultipleIndexSelectionState();
}

class _MultipleIndexSelectionState extends State<MultipleIndexSelection> {
  List list = [
  {'_id': 'u1', 'name': 'John Doe', 'age': 30},
  {'_id': 'u2', 'name': 'Robbin', 'age': 40},
  {'_id': 'u3', 'name': 'Tom', 'age': 50}
];
  int isSelectIdex = 0;
  String isSelectName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi List Select"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var currentElement;
              for (var i = -1; i < index; i++) {
                // TO DO
                currentElement = index;
              }
              return ListTile(
                title: Text("$currentElement ${list[index]['name']}",style: TextStyle(color: isSelectIdex == index ? Colors.white : Colors.black),),
                onTap: (){
                  setState(() {
                    isSelectIdex = index;
                    isSelectName = list[index]['name'];
                    print(isSelectIdex);
                  });
                },
              );
            }),
      ),
    );
  }
}
