class Usuario {

  String email;
  String senha;
  String uid;

  Usuario({this.email, this.senha, this.uid});

  @override
  String toString() {
    return 'Dados do usuário: {uid: $uid, email: $email, senha: $senha}';
  }
}