import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecoundScrenShearPref extends StatefulWidget {
  const SecoundScrenShearPref({Key key}) : super(key: key);

  @override
  _SecoundScrenShearPrefState createState() => _SecoundScrenShearPrefState();
}

class _SecoundScrenShearPrefState extends State<SecoundScrenShearPref> {
  List list= [];
  loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
       list = sharedPreferences.getStringList('list').toList() ;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context,index){
            return ListTile(
              title: Text(list[index].toString()),
            );
          })
        ),
      ),
    );
  }
}
