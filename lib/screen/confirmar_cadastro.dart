import 'package:banco_digital/modules/cadastro.dart';
import 'package:banco_digital/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/database/dao/cadastro_dao.dart';

class ConfirmarCadastro extends StatelessWidget {

  final Cadastro cadastro;
  
  ConfirmarCadastro(this.cadastro);

  final CadastroDAO _dao = CadastroDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmar Cadastro"),
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
              this._dao.save(this.cadastro).then((id) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Home(id);
                  }),
                  ModalRoute.withName('home'),
                );
              });
            },
            child: Text("Confirmar"),
          ),
        ],
      )
    );
  }
  
}

