import 'package:flutter/material.dart';
import 'package:form_validator_app/services/note.dart';

class AddNote extends StatefulWidget {
  AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final textController = TextEditingController();
  final authorController = TextEditingController();

  List<Note> noteData = [];
  late Note currentNote;

  final Helper help = Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        centerTitle: true,
        title: Text('Add Note'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                autocorrect: true,
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autocorrect: true,
                minLines: 1,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                controller: subtitleController,
                decoration: InputDecoration(
                  hintText: 'Enter subtitle',
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autocorrect: true,
                controller: authorController,
                decoration: InputDecoration(
                  hintText: 'Enter author',
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textController,
                minLines: 1,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter the text',
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              ButtonTheme(
                minWidth: 200,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {
                    currentNote = Note(
                        author: authorController.text,
                        subtitle: subtitleController.text,
                        text: textController.text,
                        title: titleController.text);
                    help.insertNote(currentNote);
                  },
                  child: Text('Insert'),
                  color: Colors.orange[200],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
