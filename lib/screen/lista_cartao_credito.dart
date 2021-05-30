import 'package:banco_digital/components/item_detalhe_gasto_cartao_credito.dart';
import 'package:banco_digital/components/progress_circular.dart';
import 'package:banco_digital/modules/cartao_credito.dart';
import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';

class ListaCartaoCredito extends StatefulWidget{
  State<StatefulWidget> createState() => _ListaCartaoCreditoState();
}

class _ListaCartaoCreditoState extends State<ListaCartaoCredito> {

  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cartão de Credito"),
        centerTitle: true,
      ),
      body: FutureBuilder<CartaoCredito>(
        future: Future.delayed(Duration(seconds: 2)).then((value) => database.getCartaoCredito()),
        builder: (context, snapshot){

          CartaoCredito credit = snapshot.data;

          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressCircular();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if(credit.gastos != null){
                return ListView.builder(
                  itemCount: credit.gastos.length,
                  itemBuilder: (context, indice) {
                    var detalheGastoCartaoCredito = credit.gastos[indice];
                    return ItemDetalheGastoCartaoCredito(detalheGastoCartaoCredito);
                  },
                );
              }
              break;
          }
          return Center(child: Text("Nenhum dado encontado"));
        }
      ),
    );
  }
}