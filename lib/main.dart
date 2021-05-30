import 'package:banco_digital/screen/auth/wrapper.dart';
import 'package:banco_digital/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'modules/usuario.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple[500],
        accentColor: Colors.deepPurple[400],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[700],
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: Scaffold(
        body: StreamProvider<Usuario>.value(
              value: AuthService().user,
              child: Wrapper(),
        ),
      )
    );
  }

}