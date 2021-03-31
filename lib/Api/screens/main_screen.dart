import 'package:flutter/material.dart';
import 'package:flutter_everything/Api/models/models.dart';
import 'package:flutter_everything/Api/service/api_service.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiServices apiServices = ApiServices();

  Future<Model> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = apiServices.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Model>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.username == null
                    ? Text(snapshot.data.username)
                    : CircularNotchedRectangle();
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
