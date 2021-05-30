import 'package:banco_digital/modules/module.dart';

class DetalheGastoCartaoCredito extends Module {
  String local;
  double valorGasto;
  String data;
  DetalheGastoCartaoCredito({this.local, this.valorGasto, this.data});

  String toString(){
    return 'Local: $local, valor gasto: R\$ $valorGasto, data: $data';
  }
}