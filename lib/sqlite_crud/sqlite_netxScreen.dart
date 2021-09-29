import 'package:flutter/material.dart';
import 'package:flutter_everything/sqlite_crud/sql_helper.dart';

class SqliteNextScreen extends StatefulWidget {
  const SqliteNextScreen({Key key}) : super(key: key);

  @override
  _SqliteNextScreenState createState() => _SqliteNextScreenState();
}

class _SqliteNextScreenState extends State<SqliteNextScreen> {
   List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NextScreen"),
        leading: IconButton(onPressed: (){
          
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),),

      ),

      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Add Data"),
              onPressed: () =>_showForm(null),
            )
          ],
        ),
      ),
    );
  }
 Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }
   Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  void _showForm(int id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        builder: (_) => Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }
}
