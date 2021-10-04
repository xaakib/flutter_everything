// import 'package:flutter/material.dart';
// import 'package:flutter_everything/Api/service/api_service.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_everything/Api/models/photo_model.dart';

// class PhotoScreen extends StatefulWidget {
//   @override
//   _PhotoScreenState createState() => _PhotoScreenState();
// }

// class _PhotoScreenState extends State<PhotoScreen> {
//   ApiServices apiServices = ApiServices();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//       ),
//       body: FutureBuilder<List<Photo>>(
//         future: apiServices.fetchPhotos(http.Client()),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? PhotosList(photos: snapshot.data)
//               : Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   final List<Photo> photos;

//   PhotosList({Key key, this.photos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Image.network(photos[index].thumbnailUrl);
//       },
//     );
//   }
// }
