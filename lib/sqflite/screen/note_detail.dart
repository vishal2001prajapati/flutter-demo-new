import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/sqflite/util/database_helper.dart';

import '../model/note.dart';

class NoteDetail extends StatefulWidget {
/*
   NoteDetail({Key? key}) : super(key: key);*/
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<NoteDetail> createState() =>
      _NoteDetailState(this.note, this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  Note note;
  DatabaseHelper databaseHelper = DatabaseHelper();
  String appBarTitle;

  _NoteDetailState(this.note, this.appBarTitle);

  // dropdown list
  final sizeList = ["High", "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = note.title;
    descriptionController.text = note.desc;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButtonFormField(
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.black,
                  ),
                  value: getPriorityAsString(note.priority),
                  items: sizeList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (valueSelectByUser) {
                    setState(() {
                      print('user select $valueSelectByUser');
                      updatePriorityAsInt('$valueSelectByUser');
                    });
                  }),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                      updateTitle();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Title', border: OutlineInputBorder()),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  onChanged: (value) {
                    updateDescription();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Description', border: OutlineInputBorder()),
                )),
            // Button
            Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              _save();
                            }, child: const Text('Save'))),
                    Container(width: 5.0),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              _delete();
                            }, child: const Text('Delete'))),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  // Convert the String priority in the form of integer before saving it to Database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  // Convert int priority to String priority and display it to user in DropDown
  String? getPriorityAsString(int value) {
    String? priority;
    switch (value) {
      case 1:
        priority = sizeList[0]; // 'High'
        break;
      case 2:
        priority = sizeList[1]; // 'Low'
        break;
    }
    return priority;
  }

  // update the title of Note object
  void updateTitle() {
    note.title = titleController.text;
  }

  // update Description
  void updateDescription() {
    note.desc = descriptionController.text;
  }


  // save data to database

  void _save() async {
    moveToScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result;
    if( note.id != null){
    result =  await databaseHelper.updateNote(note);
    } else {
      result =  await databaseHelper.insetNote(note);
    }


    if( result !=0) {
      _showAlertDialog('Status', 'note Saved Successfully');
    } else {
      _showAlertDialog('Status', 'note Saved Successfully');
    }


  }

  void _showAlertDialog(String title, String message) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (_) => alert
    );
  }

  void _delete() async {

    moveToScreen();

    if(note.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    int result = await databaseHelper.deleteNote(note.id);
    if(result != 0) {
      _showAlertDialog('Status', 'Note was deleted');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }

  }

  moveToScreen() {
    Navigator.pop(context,true);
  }

}
