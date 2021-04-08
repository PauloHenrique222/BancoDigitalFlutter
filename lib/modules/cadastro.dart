class Cadastro {
  String nome;
  String sobrenome;
  String cpf;
  String email;
  String senha;
  String telefone; 
  int id;

  Cadastro({this.nome, this.sobrenome, this.cpf, this.email,
    this.senha, this.telefone, this.id});

  @override
  String toString() {
    return 'Cadastro realizado: {id: $id, nome: $nome, sobrenome: $sobrenome, cpf: $cpf, email: $email, senha: $senha, telefone: $telefone}';
  }
}