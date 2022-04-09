import 'package:flutter/material.dart';
import 'package:form_validator_app/screens/note_list.dart';
import 'package:form_validator_app/screens/add_note.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> subjects = [
    'Computer Science',
    'Accounting',
    'Mass Communication',
    'Nursing',
    'Bio chemistry'
  ];
  String selectedSubject = 'Computer Science';

  int currentIndex = 0;

  final screens = [
    Container(
      child: NoteList(),
    ),
    Container(
      child: AddNote(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        //backgroundColor: Colors.blue,
        //selectedItemColor: Colors.white,
        //unselectedItemColor: Colors.grey,
        //showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Note',
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}
