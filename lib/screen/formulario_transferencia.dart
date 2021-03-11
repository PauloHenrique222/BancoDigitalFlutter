import 'package:banco_digital/modules/transferencia.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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

                  Transferencia transferencia = Transferencia(double.tryParse(valor), numeroConta);

                  Navigator.pop(context, transferencia);
                },
                child: Text("Confirmar"),
              ),
            ],
          ),
        ));
  }
}