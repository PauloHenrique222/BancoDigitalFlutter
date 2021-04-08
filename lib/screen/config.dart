import 'package:banco_digital/modules/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/database/dao/cadastro_dao.dart';

class Config extends StatelessWidget {

  final Cadastro cadastro;

  Config(this.cadastro);

  final CadastroDAO _dao = CadastroDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Configuração"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              child: ListView(
                  children:[
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text("Nome: ${this.cadastro.nome} ${this.cadastro.sobrenome}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text("CPF: ${this.cadastro.cpf}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text("Email: ${this.cadastro.email}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Telefone: ${this.cadastro.telefone}"),
                    ),
                  ]
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
            ),
          ],
        )
    );
  }

}