import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/sqflite/util/database_helper.dart';

import '../model/note.dart';
import 'note_detail.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;
  DatabaseHelper databaseHelper = DatabaseHelper();
  late List<Note> noteListData;

  @override
  Widget build(BuildContext context) {
    if (noteListData == null) {
      noteListData = <Note>[];
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floatingActionButton');
          navigateTpDetail(Note('', '', 2), 'Add Note');
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  // return priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.yellow;
    }
  }

  // return priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  ListView? getNoteListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 3.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    getPriorityColor(this.noteListData[position].priority),
                child: getPriorityIcon(this.noteListData[position].priority),
              ),
              title: Text(
                this.noteListData[position].title,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(this.noteListData[position].date),
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  _delete(context, noteListData[position]);
                },
              ),
              onTap: () {
                print('List Tapped');
                navigateTpDetail(this.noteListData[position], 'Edite Note');
              },
            ),
          );
        });
  }

  // title change of AppBar
  navigateTpDetail(Note note, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoteDetail(note, title)));

    if(result == true) {
      updateListView();
    }
  }

  // delete note
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id!);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Duccessfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String s) {
    final snackBar = SnackBar(content: Text(s));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteListData = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
