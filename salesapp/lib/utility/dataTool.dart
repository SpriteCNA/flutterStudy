import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:synchronized/synchronized.dart';

class DataTool {
  String _path;
  Database _db;
  final _lock = new Lock();

  static initDataBase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'SAAppDataBase');
    if (await new Directory(dirname(path)).exists()) {
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<Database> getDb() async {
    _path = await getDatabasesPath();
    if (_db == null) {
      await _lock.synchronized(() async {
        // Check again once entering the synchronized block
        if (_db == null) {
          _db = await openDatabase(_path);
        }
      });
    }
    return _db;
  }
}
