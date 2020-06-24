import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
class DatabaseHelper{
  static final _dbName        =     'demodb';
  static final _dbVersion     =     1;
  static final _tableName     =     'demotab';
  static final column1        =     'id';
  static final column2        =     'name';
  static final column3        =     'number';
  static final column4        =     'email';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if(_database!=null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  _initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    return await openDatabase(path,version: _dbVersion,onCreate: _onCreate);
  }
  Future _onCreate(Database db,int version) async{
    await db.execute(
      '''
      CREATE TABLE $_tableName (
          $column1 INTEGER PRIMARY KEY,
          $column2 TEXT NOT NULL,
          $column3 TEXT NOT NULL,
          $column4 TEXT NOT NULL
          )
      '''
      );
      
  }
  Future<int> insert(Map<String,dynamic> row ) async{
    Database db = await instance.database;
    return await db.insert("demotab",row);
  }
  Future<List<Map<String,dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query("demotab");
  }
  Future update (Map<String,dynamic> row) async{
    Database db = await instance.database;
    int id = row['id'];
    return await db.update("demotab",row,where:'id = ?',whereArgs: [id]);
  }
  Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete("demotab",where:"id=?",whereArgs: [id]);
  }
}