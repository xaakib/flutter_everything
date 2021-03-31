import 'dart:convert';
import 'package:flutter_everything/Api/models/models.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  Future<Model> fetchAlbum() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Model.fromJson(jsonDecode(response.body.toString()));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
