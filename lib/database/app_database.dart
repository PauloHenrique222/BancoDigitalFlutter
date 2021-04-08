import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {

  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, "banco_digital.db");

  final String tableCSQL = 'CREATE TABLE cadastros ('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'sobrenome TEXT, '
      'cpf TEXT, '
      'email TEXT, '
      'senha TEXT, '
      'telefone TEXT)';

  final String tableTSQL = 'CREATE TABLE transferencias ('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number TEXT, '
      'value REAL)';

  return openDatabase(
    path, 
    onCreate: (db, version) async {
      await db.execute(tableCSQL);
      await db.execute(tableTSQL);
    },
    version: 1 
  );

}