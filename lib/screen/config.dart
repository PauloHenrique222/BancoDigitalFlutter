import 'package:banco_digital/modules/dados_pessoais.dart';
import 'package:banco_digital/modules/usuario.dart';
import 'package:flutter/material.dart';

class Config extends StatelessWidget {

  final DadosPessoais dadosPessoais;

  Config(this.dadosPessoais);

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
                      leading: Icon(Icons.mail),
                      title: Text("Nome: ${this.dadosPessoais.nome}"
                          " ${this.dadosPessoais.sobrenome}"),
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