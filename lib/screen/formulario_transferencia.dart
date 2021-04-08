import 'package:flutter/material.dart';
import 'package:banco_digital/components/editor.dart';
import 'package:banco_digital/database/dao/transferencia_dao.dart';
import 'package:banco_digital/modules/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoNome = TextEditingController();

  final TransferenciaDAO _dao = TransferenciaDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova Transferência"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: this._controladorCampoNome,
                rotulo: "Nome",
                dica: "Nome",
              ),
              Editor(
                controller: this._controladorCampoNumeroConta,
                rotulo: "Número Conta",
                dica: "0000",
                tipoInput: TextInputType.number,
              ),
              Editor(
                controller: this._controladorCampoValor,
                rotulo: "Valor",
                dica: "00.00",
                tipoInput: TextInputType.number,
              ),
              RaisedButton(
                onPressed: () {
                  var numeroConta = this._controladorCampoNumeroConta.text;
                  var valor = this._controladorCampoValor.text;
                  var nome = this._controladorCampoNome.text;

                  Transferencia transferencia = Transferencia(
                    valor: double.tryParse(valor),
                    conta: numeroConta,
                    nome: nome,
                  );

                  this._dao.save(transferencia)
                    .then((id) => Navigator.pop(context, id));

                },
                child: Text("Confirmar"),
              ),
            ],
          ),
        ));
  }
}