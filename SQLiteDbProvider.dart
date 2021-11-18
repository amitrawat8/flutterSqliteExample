import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/**
 * Created by Amit Rawat on 11/18/2021.
 */
class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DatabaseKey.DATABASE_NAME);
    return await openDatabase(path,
        version: DatabaseKey.DATABASE_VERSION,
        onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute(" CREATE TABLE " +
          DatabaseKey.TABLE_NAME +
          " (" +
          DatabaseKey.ID +
          " INTEGER  PRIMARY KEY, " +
          DatabaseKey.TITLE +
          " TEXT, " +
          DatabaseKey.IMAGE_URL +
          " TEXT, " +
          DatabaseKey.FILE_TYPE +
          " TEXT, " +
          DatabaseKey.LOCAL_FILE_PATH +
          " TEXT)");
    });
  }

  Future<List<DataPdf>> getAllPdfDownload() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(DatabaseKey.TABLE_NAME,
        columns: DataPdf.columns, orderBy: DatabaseKey.ID + " ASC");
    List<DataPdf> dataPdfDownload = [];
    results.forEach((result) {
      DataPdf product = DataPdf.fromJson(result);
      dataPdfDownload.add(product);
    });
    return dataPdfDownload;
  }

  Future<DataPdf?> getProductById(int id) async {
    final db = await database;
    var result = await db!.query(DatabaseKey.TABLE_NAME,
        where: DatabaseKey.ID + " = ?", whereArgs: [id]);
    print(result);
    print(result.first);
    if (result.isNotEmpty) {
      print(result.first);
      return DataPdf.fromJson(result.first);
    } else {
      return null;
    }
  }

  insert(DataPdf dataPdf) async {
    final db = await database;
    // var maxIdResult = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    // var id = maxIdResult.first["last_inserted_id"];
    var result = await db!.rawInsert(
        "INSERT Into " +
            DatabaseKey.TABLE_NAME +
            " (" +
            DatabaseKey.ID +
            "," +
            DatabaseKey.TITLE +
            "," +
            DatabaseKey.IMAGE_URL +
            "," +
            DatabaseKey.FILE_TYPE +
            "," +
            DatabaseKey.LOCAL_FILE_PATH +
            ")" +
            " VALUES (?, ?, ?, ?, ?)",
        [
          dataPdf.id,
          dataPdf.title,
          dataPdf.ImageUrl,
          dataPdf.file_type,
          dataPdf.filepath
        ]);
    print(result);
    return result;
  }

  update(DataPdf dataPdf) async {
    final db = await database;
    var result = await db!.update(DatabaseKey.TABLE_NAME, dataPdf.toJson(),
        where: DatabaseKey.ID + " = ?", whereArgs: [dataPdf.id]);
    return result;
  }

  delete(int id) async {
    final db = await database;
    db!.delete(DatabaseKey.TABLE_NAME,
        where: DatabaseKey.ID + " = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db!.rawDelete("Delete * from " + DatabaseKey.TABLE_NAME);
  }

  Future<bool> uidExists(int id) async {
    final db = await database;
    // SELECT EXISTS(SELECT 1 FROM myTbl WHERE u_tag="tag");
    var result = await db!.rawQuery("SELECT EXISTS( SELECT 1 FROM " +
        DatabaseKey.TABLE_NAME +
        " WHERE " +
        DatabaseKey.ID +
        "=$id" +
        ")");

    int? exists = Sqflite.firstIntValue(result);
    return exists == 1;
  }
}
