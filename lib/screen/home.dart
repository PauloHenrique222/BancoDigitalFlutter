import 'package:banco_digital/modules/dados_pessoais.dart';
import 'package:banco_digital/screen/lista_cartao_credito.dart';
import 'package:banco_digital/services/auth_service.dart';
import 'package:banco_digital/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/components/item_menu.dart';
import 'package:banco_digital/screen/lista_transferencia.dart';
import 'package:banco_digital/screen/config.dart';
import 'package:banco_digital/components/progress_circular.dart';

class Home extends StatelessWidget {

  final authService = AuthService();
  final databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(Icons.exit_to_app),
            label: Text('Sair'),
            onPressed: () async {
              await authService.signOut();
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder (
        future: Future.delayed(Duration(seconds: 2)).then((value) => databaseService.getDadosPessoais()),
        builder: (context, snapshot) {
          DadosPessoais dadosPessoais = snapshot.data;

          switch(snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressCircular();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                      child: Text(
                        "Olá, ${dadosPessoais.nome}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                  ),
                  Card(
                    color: Colors.white70,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 50.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              "Flutter 2021",
                              style: TextStyle(
                                  color: Colors.deepPurple[500],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Image.network(
                              "https://flutter.io/images/catalog-widget-placeholder.png"),
                          Divider(),
                          Text(
                            "Criado com muito amor por Paulo Henrique & Rogerio",
                            style: TextStyle(
                                color: Colors.deepPurple[500],
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ItemMenu(
                        action: ListaTransferencia(),
                        icone: Icons.cached,
                        nomeMenu: "Transferências",
                      ),
                      ItemMenu(
                        action: ListaCartaoCredito(),
                        icone: Icons.credit_card,
                        nomeMenu: "Cartão de Credito",
                      ),
                      ItemMenu(
                        action: Config(dadosPessoais),
                        icone: Icons.settings,
                        nomeMenu: "Configuração",
                      )
                    ],
                  ),
                ],
              );
              break;
          }
          return Text("Error unkonw!");
        },
      ),
    );
  }
}