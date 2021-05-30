import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/components/progress_circular.dart';
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

  @override
  Widget build(BuildContext context) {

    DatabaseService database = DatabaseService();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Transferências"),
        centerTitle: true,
      ),
      body: FutureBuilder <List<Transferencia>> (
        future: Future.delayed(Duration(seconds: 2)).then((value) => database.getTransferencias()),
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
              if(listaTransferencias.length != 0){
                return ListView.builder(
                  itemCount: listaTransferencias.length,
                  itemBuilder: (context, indice) {
                    var transferencia = listaTransferencias[indice];
                    return ItemTransferencia(transferencia);
                  },
                );
              }
              break;
          }
          return Center(child: Text("Nenhum dado encontado"));
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
          future.then((id){
            setState(() {
            });
          });
        },
      ),
    );
  }
}