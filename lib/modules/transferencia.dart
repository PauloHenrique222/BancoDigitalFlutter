class Transferencia {
  double valor;
  String conta;
  String nome;
  int id;

  Transferencia({this.valor, this.conta, this.nome, this.id});

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, conta: $conta, nome: $nome}';
  }
}