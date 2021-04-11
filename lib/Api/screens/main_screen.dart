import 'package:flutter/material.dart';
import 'package:flutter_everything/Api/models/models.dart';
import 'package:flutter_everything/Api/models/testModeldata.dart';
import 'package:flutter_everything/Api/service/api_service.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ApiServices apiServices = ApiServices();
  TestData testData;
  Future<Model> futureAlbum;
  initData() async {
    testData = await apiServices.testDatas();
  }

  @override
  void initState() {
    super.initState();
    initData();
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
        body: ListView(
          children: [
            Container(
              height: 500,

              // child: FutureBuilder<TestData>(
              //   future: apiServices.testDatas(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text();
              //     } else if (snapshot.hasError) {
              //       return Text("${snapshot.error}");
              //     }

              // ),

              child: testData.allLocation == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: testData.allLocation.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(testData.allLocation[index].location
                                .toString()),
                            subtitle: Text(
                              testData.allLocation[index].country.toString(),
                            ));
                      }),

              //     // By default, show a loading spinner.
              //     return CircularProgressIndicator();
              //   },
              // ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 500,

          

              child: testData.frontHotel == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: testData.frontHotel.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(testData.frontHotel[index].location
                                .toString()),
                            subtitle: Text(
                              testData.frontHotel[index].amenities[index].name.toString(),
                            ));
                      }),

              //     // By default, show a loading spinner.
              //     return CircularProgressIndicator();
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
