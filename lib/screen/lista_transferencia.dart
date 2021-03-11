import 'package:banco_digital/modules/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';
import '../components/item_transferencia.dart';

class ListaTransferencia extends StatefulWidget {

  final List<Transferencia> listaTransferencias = List();

  @override
  State<StatefulWidget> createState() {

    return _ListaTransferenciaState();
  }
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Transferências"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.listaTransferencias.length,
        itemBuilder: (context, indice) {
          var transferencia = widget.listaTransferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future <Transferencia> future = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              })
          );

          future.then((transferenciaRecebida){

            if(transferenciaRecebida == null
              || transferenciaRecebida.valor == null
              || transferenciaRecebida.conta == null) {
              return;
            }

            setState(() {
              widget.listaTransferencias.add(transferenciaRecebida);
            });

          });
        },
      ),
    );
  }
}

