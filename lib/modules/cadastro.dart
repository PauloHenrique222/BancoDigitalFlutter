class Cadastro {
  String nome;
  String cpf;
  String email;
  String telefone;

  Cadastro(this.nome, this.cpf, this.email, this.telefone);

  @override
  String toString() {
    return 'Cadastro realizado: {nome: $nome, cpf: $cpf, email: $email, telefone: $telefone}';
  }
}