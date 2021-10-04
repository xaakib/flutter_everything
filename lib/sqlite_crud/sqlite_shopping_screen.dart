// import 'package:flutter/material.dart';

// import 'sql_helper.dart';

// class SqliteShoppingScreen extends StatefulWidget {
//   const SqliteShoppingScreen({ Key key }) : super(key: key);

//   @override
//   _SqliteShoppingScreenState createState() => _SqliteShoppingScreenState();
// }

// class _SqliteShoppingScreenState extends State<SqliteShoppingScreen> {
//     List<Map<String, dynamic>> _journals = [];
//       bool _isLoading = true;
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
    
//   }
//    @override
//   void initState() {
//     super.initState();
//     _refreshJournals();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return _isLoading ? Center(child: CircularProgressIndicator()): Scaffold(
//       appBar: AppBar(title: Text("ShoopinCart"),),
//       body: Container(height: MediaQuery.of(context).size.height,
//       child: Column(
//         children: [
//           Container(height: 500,child: ListView.builder(
//             itemCount: _journals.length,
//             itemBuilder: (context,index){
//             return ListTile(
//               title: Text(_journals[index]['title']),
//             );
//           }),)
//         ],
//       ),
//       ),
      
//     );
//   }
// }