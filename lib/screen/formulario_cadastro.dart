import 'package:banco_digital/modules/cadastro.dart';
import 'package:flutter/material.dart';
import '../components/editor.dart';
import 'confirmar_cadastro.dart';

class FormularioCadastro extends StatelessWidget {

  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoSobrenome = TextEditingController();
  final TextEditingController _controladorCampoCpf = TextEditingController();
  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoSenha = TextEditingController();
  final TextEditingController _controladorCampoTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: this._controladorCampoNome,
                rotulo: "Nome",
                dica: "Paulo",
                tipoInput: TextInputType.text,
              ),
              Editor(
                controller: this._controladorCampoSobrenome,
                rotulo: "Sobrenome",
                dica: "Henrique",
                tipoInput: TextInputType.number,
              ),
              Editor(
                controller: this._controladorCampoCpf,
                rotulo: "CPF",
                dica: "000.000.000.00",
                tipoInput: TextInputType.number,
              ),
              Editor(
                controller: this._controladorCampoEmail,
                rotulo: "E-mail",
                dica: "paulohenrique@gmail.com",
                tipoInput: TextInputType.text,
              ),
              Editor(
                controller: this._controladorCampoSenha,
                rotulo: "Senha",
                dica: "1234",
                tipoInput: TextInputType.text,
              ),
              Editor(
                controller: this._controladorCampoTelefone,
                rotulo: "Telefone",
                dica: "(00)0000-0000",
                tipoInput: TextInputType.number,
              ),
              RaisedButton(
                onPressed: () {
                  var nome = this._controladorCampoNome.text;
                  var sobrenome = this._controladorCampoSobrenome.text;
                  var cpf = this._controladorCampoCpf.text;
                  var email = this._controladorCampoEmail.text;
                  var senha = this._controladorCampoSenha.text;
                  var telefone = this._controladorCampoTelefone.text;

                  Cadastro cadastro = Cadastro(
                    nome: nome, 
                    sobrenome: sobrenome, 
                    cpf: cpf, 
                    email: email,
                    senha: senha,
                    telefone: telefone
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ConfirmarCadastro(cadastro);
                    }) 
                  );
                },
                child: Text("Proximo"),
              ),
            ],
          ),
        ));
  }
}