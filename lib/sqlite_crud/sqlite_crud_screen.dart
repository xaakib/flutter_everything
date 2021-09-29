

import 'package:flutter/material.dart';
import 'package:flutter_everything/sqlite_crud/sql_helper.dart';
import 'package:flutter_everything/sqlite_crud/sqlite_netxScreen.dart';
import 'package:flutter_everything/sqlite_crud/sqlite_shopping_screen.dart';
import 'package:get/get.dart';

class SqliteCrudScreen extends StatefulWidget {
  const SqliteCrudScreen({Key key}) : super(key: key);

  @override
  _SqliteCrudScreenState createState() => _SqliteCrudScreenState();
}

class _SqliteCrudScreenState extends State<SqliteCrudScreen> {
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

// Insert a new journal to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
        actions: [
          Text(_journals.length.toString()),
          IconButton(onPressed: (){}, icon: IconButton(onPressed: (){
           Get.to(SqliteShoppingScreen()); 
          },icon: Icon(Icons.shopping_bag_outlined),))
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: _journals.length,
                    itemBuilder: (context, index) => Card(
                      color: Colors.orange[200],
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                          title: Text(_journals[index]['title']),
                          subtitle: Text(_journals[index]['description']),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () =>
                                      _showForm(_journals[index]['id']),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      _deleteItem(_journals[index]['id']),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SqliteNextScreen()));
                  },
                  child: Text("Next Screen"),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
