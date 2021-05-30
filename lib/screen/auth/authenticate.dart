import 'file:///C:/Users/paul1/Downloads/Faculdade/LPIV/BancoDigital/banco_digital/lib/screen/auth/login.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthtenticateState();
}

class _AuthtenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Login(),
    );
  }
}