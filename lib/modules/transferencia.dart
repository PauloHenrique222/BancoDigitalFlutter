class Transferencia {
  double valor;
  String conta;
  String nome;

  Transferencia({this.valor, this.conta, this.nome});

  @override
  String toString() {
    return 'Transferencia { valor: $valor, conta: $conta, nome: $nome }';
  }
}