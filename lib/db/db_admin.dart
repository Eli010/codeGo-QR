import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? _myDatabase;

  checkDatabase() {}

  Future initDatabase() async {
    Directory myDirectory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(myDirectory.path, "QrDB.db");
    openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
          "CREATE TABLE QR(in INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, observation TEXT, address TEXT,url TEXT, datetime TEXT)",
        );
      },
    );
  }
}
