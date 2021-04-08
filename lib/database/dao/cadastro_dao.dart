import 'package:banco_digital/database/app_database.dart';
import 'package:banco_digital/modules/cadastro.dart';
import 'package:sqflite/sqflite.dart';

class CadastroDAO {

  Future<int> save(Cadastro cadastro) async {
    final Database db = await createDatabase();

    final Map<String, dynamic> cadastroMap = toMap(cadastro);
    return db.insert("cadastros", cadastroMap);
  }

  Map<String, dynamic> toMap(Cadastro cadastro) {
    final Map<String, dynamic> cadastroMap = Map();

    cadastroMap["nome"] = cadastro.nome;
    cadastroMap["sobrenome"] = cadastro.sobrenome;
    cadastroMap["cpf"] = cadastro.cpf;
    cadastroMap["email"] = cadastro.email;
    cadastroMap["senha"] = cadastro.senha;
    cadastroMap["telefone"] = cadastro.telefone;

    return cadastroMap;
  }

  Future<Cadastro> findCadastro() async {

    final Database db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query("cadastros");

    return Cadastro(
        nome: maps.first['nome'],
        sobrenome: maps.first['sobrenome'],
        cpf: maps.first['cpf'],
        email: maps.first['email'],
        telefone: maps.first['telefone'],
        id: maps.first['id']
    );
  }

  Future<int> logar(String email, String senha) async {

    final Database db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query("cadastros");

    for(Map<String, dynamic> map in maps) {
      if(map['email'] == email && map['senha'] == senha){
        return map['id'];
      }
    }
    return null;
  }

}