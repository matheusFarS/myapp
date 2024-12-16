import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'adereco.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    
    String sql =
        'CREATE TABLE ADERECOS (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT, url_image TEXT, texto_completo TEXT);';
    await db.execute(sql);

    sql =
        "INSERT INTO ADERECOS (id, titulo, descricao, url_image, texto_completo) VALUES (1, 'Revolução Francesa', 'O que foi?','https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Anonymous_-_Prise_de_la_Bastille.jpg/1024px-Anonymous_-_Prise_de_la_Bastille.jpg', 'A Revolução Francesa foi...');";
    await db.execute(sql);
  }
}
