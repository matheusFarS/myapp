import 'package:myapp/bd/db_helper.dart';
import 'package:myapp/domain/aderecos.dart';
import 'package:sqflite/sqflite.dart';

class AderecosDao {
  salvarAdereco(Aderecos adereco) async {
    Database database = await DBHelper().initDB();
    await database.insert('ADERECOS', adereco.toJson());
  }
  
  listarAderecos() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM ADERECOS;';
    var result = await database.rawQuery(sql);

    List<Aderecos> lista = [];
    for (var json in result) {
      Aderecos adereco = Aderecos.fromJson(json);
      lista.add(adereco);
    }

    return lista;
  }
}