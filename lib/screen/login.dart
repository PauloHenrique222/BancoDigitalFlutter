
import 'package:banco_digital/components/editor.dart';
import 'package:banco_digital/screen/formulario_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/screen/home.dart';
import 'package:banco_digital/database/dao/cadastro_dao.dart';

class Login extends StatelessWidget {

  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();

  final CadastroDAO _dao = CadastroDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                child: Icon(
                  Icons.monetization_on,
                  color: Colors.deepPurple[500],
                  size: 100,
                ),
              ),
              Text(
                "New Bank",
                style: TextStyle(
                    color: Colors.deepPurple[500],
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Editor(
                controller: this._controladorCampoEmail,
                rotulo: "E-mail",
                dica: "paulo@gmail.com",
                tipoInput: TextInputType.text,
              ),
              Editor(
                controller: this._controladorCampoSenha,
                rotulo: "Senha",
                dica: "1234",
                tipoInput: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                child: SizedBox(
                  width: 380,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      var email = this._controladorCampoEmail.text;
                      var senha = this._controladorCampoSenha.text;

                      this._dao.logar(email, senha)
                          .then((id) {
                        if(id == null){
                        }else{
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Home();
                            }),
                            ModalRoute.withName('lista_transferencia'),
                          );
                        }
                      }
                      );
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 380,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Future <int> future = Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return FormularioCadastro();
                        })
                    );
                  },
                  child: Text(
                      "Cadastra-se",
                      style: TextStyle(fontSize: 17.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}