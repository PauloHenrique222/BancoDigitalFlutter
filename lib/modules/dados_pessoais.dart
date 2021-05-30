class DadosPessoais {

  String nome;
  String sobrenome;
  String sexo;

  DadosPessoais({this.nome, this.sobrenome});

  @override
  String toString() {
    return 'Dados do usuário: { uid: $nome, email: $sobrenome }';
  }
}