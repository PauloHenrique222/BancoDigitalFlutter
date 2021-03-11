import 'package:banco_digital/modules/cadastro.dart';
import 'package:banco_digital/screen/lista_transferencia.dart';
import 'package:flutter/material.dart';

class ConfirmarCadastro extends StatelessWidget {

  final Cadastro cadastro;
  
  ConfirmarCadastro(this.cadastro);

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
                  title: Text("Nome: ${this.cadastro.nome}"),
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return ListaTransferencia();
                }),
                ModalRoute.withName('lista_transferencia'), 
              );
            },
            child: Text("Confirmar"),
          ),
        ],
      )
    );
  }
  
}

