// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:photofilters/photofilters.dart';
// import 'package:image/image.dart' as imageLib;
// import 'package:image_picker/image_picker.dart';

// class PhotoFilter extends StatefulWidget {
//   @override
//   _PhotoFilterState createState() => _PhotoFilterState();
// }

// class _PhotoFilterState extends State<PhotoFilter> {
//   String fileName;
//   List<Filter> filters = presetFiltersList;
//   final picker = ImagePicker();
//   File imageFile;

//   Future getImage(context) async {
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       imageFile = new File(pickedFile.path);
//       fileName = basename(imageFile.path);
//       var image = imageLib.decodeImage(await imageFile.readAsBytes());
//       image = imageLib.copyResize(image, width: 600);
//       Map imagefile = await Navigator.push(
//         context,
//         new MaterialPageRoute(
//           builder: (context) => new PhotoFilterSelector(
//             title: Text("Photo Filter Example"),
//             image: image,
//             filters: presetFiltersList,
//             filename: fileName,
//             loader: Center(child: CircularProgressIndicator()),
//             fit: BoxFit.contain,
//           ),
//         ),
//       );

//       if (imagefile != null && imagefile.containsKey('image_filtered')) {
//         setState(() {
//           imageFile = imagefile['image_filtered'];
//         });
//         print(imageFile.path);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Photo Filter Example'),
//       ),
//       body: Center(
//         child: new Container(
//           child: imageFile == null
//               ? Center(
//                   child: new Text('No image selected.'),
//                 )
//               : Image.file(new File(imageFile.path)),
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: () => getImage(context),
//         tooltip: 'Pick Image',
//         child: new Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
