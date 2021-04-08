import 'package:banco_digital/screen/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
      home: Login(),
    );
  }

}