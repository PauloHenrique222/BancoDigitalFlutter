import 'package:banco_digital/screen/auth/gerar_dados.dart';
import 'package:banco_digital/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAnon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingInAnonState();
}

class _SingInAnonState extends State<LoginAnon> {

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Anônimo"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Icon(
              Icons.monetization_on,
              color: Colors.deepPurple[500],
              size: 100,
            ),
            Text(
              "New Bank",
              style: TextStyle(
                color: Colors.deepPurple[500],
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text("Logar"),
              onPressed: () async {
                dynamic result = await authService.singInAnon();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("uid", result.uid);
                int count = 2;
                Navigator.of(context).popUntil((_) => count-- <= 0);
              },
            )
          ],
        ),
      ),
    );
  }
}