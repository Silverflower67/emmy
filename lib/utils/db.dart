import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDb() async {
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(join(await getDatabasesPath(), "emmydb.db"),
      onCreate: (db, version) {
    return db.execute("""CREATE TABLE teachers(
          id INTEGER PRIMARY KEY, 
          name TEXT, lastName TEXT,
          email STRING,
          phone TEXT,
          color STRING,
          gender INT,
          isReplacing BOOL)""");
  }, version: 1);
}
