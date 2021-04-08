import 'package:banco_digital/database/dao/cadastro_dao.dart';
import 'package:flutter/material.dart';
import 'package:banco_digital/components/item_menu.dart';
import 'package:banco_digital/screen/lista_transferencia.dart';
import 'package:banco_digital/screen/config.dart';
import 'package:banco_digital/modules/cadastro.dart';
import 'package:banco_digital/components/progress_circular.dart';

class Home extends StatelessWidget {

  final CadastroDAO _dao = CadastroDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder <Cadastro> (
        future: Future.delayed(Duration(seconds: 2)).then((value) => this._dao.findCadastro()),
        builder: (context, snapshot) {
         Cadastro cadastro = snapshot.data;
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
                      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 8.0, 0.0),
                      child: Text(
                        "Olá, ${cadastro.nome}",
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
                        action: Config(cadastro),
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