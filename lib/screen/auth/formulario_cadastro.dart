import 'package:banco_digital/screen/auth/gerar_dados.dart';
import 'package:banco_digital/screen/formulario_dados_pessoais.dart';
import 'package:banco_digital/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_anon.dart';

class FormularioCadastro extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FormularioCadastroState();
  }
}

class _FormularioCadastroState extends State<FormularioCadastro> {

  String email = "";
  String senha = "";
  final _auth = AuthService();
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
                      validator: (val) => val.isEmpty ? "Insira o E-mail" : null,
                      decoration: const InputDecoration(labelText: "E-mail"),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? "Insira a senha" : null,
                      decoration: const InputDecoration(labelText: "Senha"),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          senha = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    RaisedButton(
                      child: Text("Proximo"),
                      onPressed: () async {
                        loading = true;
                        if(_formkey.currentState.validate()) {
                          dynamic result = await _auth.registerWithEmailAndPassword(email, senha);
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("uid", result.uid);
                          Future <int> future = Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return FormularioDadosPessoais();
                              })
                          );
                        } else {
                          loading = false;
                          setState(() => error = "Por favor preencha todos os campos");
                        }
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RaisedButton(
                        child: Text("Login Anônimo"),
                        onPressed: () {
                          Future <int> future = Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return LoginAnon();
                              })
                          );
                        }
                    ),
                  ],
                ),
              ),
          ),
        );
  }
}