import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// original project https://github.com/evandrofuhr/growdev_advanced_call_2507
class DBHelper {
  static const int VERSAO = 1;
  static const String DB = 'database.db';
  Database _db;
  static DBHelper _instancia;
  factory DBHelper() {
    if (_instancia == null) {
      _instancia = DBHelper._internal();
    }
    return _instancia;
  }
  DBHelper._internal();

  Future<Database> getDatabase() async {
    if (_db == null) {
      var _directory = await getDatabasesPath();
      var _path = join(_directory, DB);
      _db = await openDatabase(
        _path,
        version: VERSAO,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
      );
    }
    return _db;
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // put db changes here!
    // use this sample to validate versions
    // if (oldVersion < 2) { }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
       create table appstate (
            id integer primary key autoincrement,
            email text,
            token text
        );
      ''');
  }
}
