class Transferencia {
  double valor;
  String conta;
  String nome;
  int id;
  int id_user;

  Transferencia({this.valor, this.conta, this.nome, this.id, this.id_user});

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, conta: $conta, nome: $nome, id_user: $id_user}';
  }
}