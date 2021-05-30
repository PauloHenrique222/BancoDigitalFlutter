import 'package:banco_digital/components/progress_circular.dart';
import 'package:banco_digital/modules/dados_pessoais.dart';
import 'package:banco_digital/screen/auth/formulario_cadastro.dart';
import 'package:banco_digital/screen/auth/gerar_dados.dart';
import 'package:banco_digital/services/auth_service.dart';
import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = "";
  String senha = "";
  final _auth = AuthService();
  String error = "";
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  final databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {

    return
      loading
          ? ProgressCircular()
          : Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          actions: [
            FlatButton.icon(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return FormularioCadastro();
                  }),
                );
              },
              icon: Icon(Icons.person),
              label: Text("Cadastrar"),
              textColor: Colors.white,
            )
          ],
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
                  child: Text("Login"),
                  onPressed: () async {
                    loading = true;
                    if(_formkey.currentState.validate()) {
                      dynamic result = await _auth.singInRegisteredUser(email, senha);

                      if(result == null && loading) {
                        setState(() => error = "Login e senha inválidos");
                      }
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("uid", result.uid);

                      loading = false;
                    } else {
                      loading = false;
                      setState(() => error = "Login e senha inválidos");
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