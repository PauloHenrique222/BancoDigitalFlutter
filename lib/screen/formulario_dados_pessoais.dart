import 'package:banco_digital/modules/dados_pessoais.dart';
import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FormularioDadosPessoais extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FormularioDadosPessoaisState();
  }
}

class _FormularioDadosPessoaisState extends State<FormularioDadosPessoais> {

  String nome = "";
  String sobrenome = "";
  final databaseService = DatabaseService();
  String error = "";
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 40.0
        ),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                color: Colors.deepPurple[500],
                size: 100,
              ),
              Center(
                child: Text(
                  "New Bank",
                  style: TextStyle(
                    color: Colors.deepPurple[500],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  error,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red
                  ),
                ),
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Insira o seu nome" : null,
                decoration: const InputDecoration(labelText: "Nome"),
                onChanged: (val) {
                  setState(() {
                    nome = val;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Insira seu sobrenome" : null,
                decoration: const InputDecoration(labelText: "Sobrenome"),
                onChanged: (val) {
                  setState(() {
                    sobrenome = val;
                  });
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                onPressed: () async {
                  loading = true;
                  if(_formkey.currentState.validate()) {
                    DadosPessoais dadosPessoais =
                    DadosPessoais(nome: nome, sobrenome: sobrenome);
                    databaseService.createDadosPessoais(dadosPessoais);
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("nome", nome);
                    prefs.setString("sobrenome", sobrenome);
                    int count = 2;
                    Navigator.of(context).popUntil((_) => count-- <= 0);
                  } else {
                    loading = false;
                    setState(() => error = "Por favor preencha todos os campos");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}