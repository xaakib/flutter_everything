import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_everything/Api/models/models.dart';
import 'package:flutter_everything/Api/models/photo_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Model> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    return compute(parsePhotos, response.body);
  }

  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
