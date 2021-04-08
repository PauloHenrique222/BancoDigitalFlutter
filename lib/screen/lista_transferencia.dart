import 'package:flutter/material.dart';
import 'package:banco_digital/components/progress_circular.dart';
import 'package:banco_digital/database/dao/transferencia_dao.dart';
import 'package:banco_digital/screen/formulario_transferencia.dart';
import 'package:banco_digital/modules/transferencia.dart';
import '../components/item_transferencia.dart';

class ListaTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return _ListaTransferenciaState();
  }
}

class _ListaTransferenciaState extends State<ListaTransferencia> {

  final TransferenciaDAO _dao = TransferenciaDAO();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Transferências"),
        centerTitle: true,
      ),
      body: FutureBuilder <List<Transferencia>> (
        future: Future.delayed(Duration(seconds: 2)).then((value) => this._dao.findAll()),
        builder: (context, snapshot) {
          List<Transferencia> listaTransferencias = snapshot.data;

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressCircular();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemCount: listaTransferencias.length,
                itemBuilder: (context, indice) {
                  var transferencia = listaTransferencias[indice];
                  return ItemTransferencia(transferencia);
                },
              );
              break;
          }

          return Text("Error unkonw!");
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future <int> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              })
          );
        },
      ),
    );
  }
}