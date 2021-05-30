import 'package:banco_digital/modules/usuario.dart';
import 'package:banco_digital/screen/auth/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usuario>(context);

    if(user != null) {
      return Home();
    } else {
      return Authenticate();
    }

  }

}