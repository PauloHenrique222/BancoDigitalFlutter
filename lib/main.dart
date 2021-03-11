import 'package:banco_digital/screen/formulario_cadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App()); //MaterialApp
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
        accentColor: Colors.deepPurple[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: FormularioCadastro(),
    );
  }
}