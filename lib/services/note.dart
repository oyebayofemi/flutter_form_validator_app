import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';

final tableName = 'note';
final columnId = 'id';
final columnTitle = 'title';
final columnSubTitle = 'substitle';
final columnText = 'text';
final columnAuthor = 'author';

class Note {
  var title;
  var subtitle;
  var text;
  var author;
  int? id;

  Note(
      {required this.author,
      required this.subtitle,
      required this.text,
      required this.title,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      columnTitle: this.title,
      columnSubTitle: this.subtitle,
      columnText: this.text,
      columnAuthor: this.author,
    };
  }
}

class Helper {
  late Database db;

  Helper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'notes_practice.db'),
      onCreate: (db, version) {
        return db.execute("""
              CREATE TABLE $tableName(
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnTitle  TEXT NOT NULL,
                $columnSubTitle TEXT,
                $columnText TEXT,
                $columnAuthor TEXT)
          """);
      },
      version: 1,
    );
  }

  Future<void> insertNote(Note notes) async {
    try {
      db.insert(tableName, notes.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error) {
      print(error);
    }
  }

  Future<List<Note>> getDatabase() async {
    final List<Map<String, dynamic>> noteData = await db.query(tableName);

    return List.generate(noteData.length, (index) {
      return Note(
          author: noteData[index][columnAuthor],
          subtitle: noteData[index][columnSubTitle],
          text: noteData[index][columnText],
          title: noteData[index][columnTitle],
          id: noteData[index][columnId]);
    });
  }

  Future updateNote(Note notes) async {
    return db
        .update(tableName, notes.toMap(), where: 'id?', whereArgs: [notes.id]);
  }

  Future deleteNote(Note, id) async {
    return db.rawDelete('DELETE FROM $tableName WHERE id =$id');
  }
}
