import 'package:banco_digital/modules/detalhe_gasto_cartao_credito.dart';
import 'package:flutter/material.dart';


class ItemDetalheGastoCartaoCredito extends StatelessWidget {
  final DetalheGastoCartaoCredito detalheGastoCartaoCredito;

  ItemDetalheGastoCartaoCredito(this.detalheGastoCartaoCredito);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.detalheGastoCartaoCredito.toString()),
      ),
    );
  }
}