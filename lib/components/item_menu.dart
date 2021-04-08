import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  String nomeMenu;
  IconData icone;
  Widget action;


  ItemMenu({this.nomeMenu, this.icone, this.action});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => this.action
              )
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
          height: 80,
          width: 187,
          color: Theme.of(context).accentColor,
          child: Column(
            children: <Widget>[
              Icon(
                this.icone,
                color: Colors.white,
              ),
              Text(
                this.nomeMenu,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }


}

