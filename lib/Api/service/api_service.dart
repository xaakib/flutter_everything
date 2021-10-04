// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_everything/Api/models/photo_model.dart';
// import 'package:flutter_everything/Api/models/testModeldata.dart';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   // Future<Model> fetchAlbum() async {
//   //   final response =
//   //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

//   //   if (response.statusCode == 200) {
//   //     return Model.fromJson(jsonDecode(response.body));
//   //   } else {
//   //     throw Exception('Failed to load album');
//   //   }
//   // }

//   Future<List<Photo>> fetchPhotos(http.Client client) async {
//     var response = await client
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

//     return compute(parsePhotos, response.body);
//   }

//   List<Photo> parsePhotos(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//     return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//   }

//   Future<List<Photo>> testData(http.Client client) async {
//     var response = await client
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//     print(compute);

//     return compute(parsePhotos, response.body);
//   }

//   Future testDatas() async {
//     String url = "https://vromonbuzz.com/api/home/alldata?appKey=VromonBuzz";
//     http.Response response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       return TestData.fromJson(jsonDecode(response.body)[0]);
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }
// }
