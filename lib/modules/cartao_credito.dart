import 'package:banco_digital/modules/detalhe_gasto_cartao_credito.dart';
import 'package:banco_digital/modules/module.dart';

class CartaoCredito extends Module{
  double limite;
  List<DetalheGastoCartaoCredito> gastos;

  CartaoCredito({this.limite, this.gastos});

  List<Map<dynamic, dynamic>> convertGastosToMap(){
    List<Map> list = List();
    for(DetalheGastoCartaoCredito gasto in this.gastos){
      final Map<dynamic, dynamic> gastoMap = Map();

      gastoMap['valor_gasto'] = gasto.valorGasto;
      gastoMap['local'] = gasto.local;
      gastoMap['data'] = gasto.data;
      list.add(gastoMap);
    }
    return list;
  }

  List<DetalheGastoCartaoCredito> convertMapToGastos(List<dynamic> mapGastos) {
    final List<DetalheGastoCartaoCredito> gastos = List();
    for(Map<dynamic, dynamic> map in mapGastos) {
      DetalheGastoCartaoCredito gasto = DetalheGastoCartaoCredito(
        valorGasto: map['valor_gasto'],
        local: map['local'],
        data: map['data']
      );
      gastos.add(gasto);
    }
    return gastos;
  }

}