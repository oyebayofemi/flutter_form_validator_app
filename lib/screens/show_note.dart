import 'package:flutter/material.dart';
import 'package:form_validator_app/services/note.dart';

class ShowNote extends StatefulWidget {
  ShowNote({Key? key}) : super(key: key);

  @override
  State<ShowNote> createState() => _ShowNoteState();
}

Map noteDetails = {};

class _ShowNoteState extends State<ShowNote> {
  final Helper helps = Helper();

  @override
  Widget build(BuildContext context) {
    noteDetails = ModalRoute.of(context)!.settings.arguments as Map;

    print(noteDetails);
    return Scaffold(
      backgroundColor: noteDetails['color']['color'],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'NOTES',
          style: TextStyle(
            color: noteDetails['color']['color'],
            letterSpacing: 2.0,
            fontSize: 27,
          ),
        ),
        iconTheme: IconThemeData(
          color: noteDetails['color']['color'],
        ),
        actions: [
          IconButton(
              color: noteDetails['color']['color'],
              onPressed: () {
                setState(() {
                  helps.deleteNote(Note, noteDetails['id']);
                });
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              alignment: Alignment.topLeft,
              child: Text(
                noteDetails['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                noteDetails['subtitle'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              alignment: Alignment.topLeft,
              child: Text(
                noteDetails['text'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                noteDetails['author'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
