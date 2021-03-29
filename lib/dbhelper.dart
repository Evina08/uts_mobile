import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'book.dart';
import 'anggota.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'perpustakaan.db';

    //create, read databases
    var perpustakaanDatabase =
        openDatabase(path, version: 1, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return perpustakaanDatabase;
  }

  //pembuatan table book
  void _createDb(Database db, int version) async {
    await db.execute('''
 CREATE TABLE book (
 idBuku INTEGER PRIMARY KEY AUTOINCREMENT,
  kategoriBuku TEXT,
  namaBuku TEXT,
  penerbitBuku TEXT,
  penulisBuku TEXT,
  jumlahBuku INTEGER
 )
 ''');
  }
}
