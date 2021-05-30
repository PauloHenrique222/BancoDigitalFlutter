import 'package:banco_digital/modules/cartao_credito.dart';
import 'package:banco_digital/modules/detalhe_gasto_cartao_credito.dart';
import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';

class GerarDados extends StatefulWidget{
  State<StatefulWidget> createState() => _GerarDadosState();
}

class _GerarDadosState extends State<GerarDados> {

  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: database.getCartaoCredito(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:

              CartaoCredito credit = CartaoCredito();
              final detalhe1 = DetalheGastoCartaoCredito(local: 'Amazon', valorGasto: 100, data: '21-01-2021');
              final detalhe2 = DetalheGastoCartaoCredito(local: 'Mercado Livre', valorGasto: 1000, data: '21-01-2021');
              List<DetalheGastoCartaoCredito> gastos = [];
              gastos.add(detalhe1);
              gastos.add(detalhe2);
              credit.limite = 1000;
              credit.gastos = gastos;

              database.createCartaoCredito(credit);

              break;
          }
          return Text("Error Unknow");
        }
    );
  }
}