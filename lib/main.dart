import 'package:flutter/material.dart';
import 'package:form_validator_app/login_page.dart';
import 'package:form_validator_app/home_page.dart';
import 'package:form_validator_app/screens/add_note.dart';
import 'package:form_validator_app/screens/note_list.dart';
import 'package:form_validator_app/screens/show_note.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage(),
      '/note': (context) => NoteList(),
      '/show': (context) => ShowNote(),
      '/add': (context) => AddNote(),
    },
  ));
}
