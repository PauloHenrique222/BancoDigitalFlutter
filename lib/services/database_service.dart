import 'package:banco_digital/modules/cartao_credito.dart';
import 'package:banco_digital/modules/dados_pessoais.dart';
import 'package:banco_digital/modules/transferencia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  String uid;

  DatabaseService(){
    SharedPreferences.getInstance().then((value) => {
      uid = value.get("uid")
    });
  }

  final CollectionReference dadosPessoaisCollection = FirebaseFirestore.instance
      .collection('dados_pessoais');

  final CollectionReference creditCardCollection = FirebaseFirestore.instance
      .collection('cartao_credito');

  final CollectionReference transferenciasCollection = FirebaseFirestore.instance
      .collection('transferencias');

  Future createDadosPessoais(DadosPessoais dadosPessoais) async {
    return await dadosPessoaisCollection.doc(uid)
        .set({
          'nome': dadosPessoais.nome,
          'sobrenome': dadosPessoais.sobrenome
        }
    );
  }

  Future<DadosPessoais> getDadosPessoais() async {
    return await dadosPessoaisCollection.doc(uid).get()
        .then((value) {
      final data = value.data();
      final DadosPessoais dadosPessoais = DadosPessoais();
      if (data != null) {
        dadosPessoais.nome = data['nome'];
        dadosPessoais.sobrenome = data['sobrenome'];
      }else{
        dadosPessoais.nome = 'Anônimo';
        dadosPessoais.sobrenome = '';
      }
      return dadosPessoais;
    });
  }

  Future createCartaoCredito(CartaoCredito credit) async {
    return await creditCardCollection.doc(uid)
        .set({
          'limite': credit.limite,
          'gastos': credit.convertGastosToMap()
        }
    );
  }

  Future<CartaoCredito> getCartaoCredito() async {
    return await creditCardCollection.doc(uid).get()
        .then((value) {
          final data = value.data();
          final CartaoCredito credit = CartaoCredito();
          if (data != null) {
            credit.limite = data['limite'];
            credit.gastos = credit.convertMapToGastos(data['gastos']);
          }
          return credit;
        });
  }

  Future createTransferencia(Transferencia transferencia) async {
    List<Transferencia> transferencias = await getTransferencias();
    transferencias.add(transferencia);
    List<Map> list = List();
    for(Transferencia transferencia in transferencias){
      final Map<dynamic, dynamic> transferenciaMap = Map();
      transferenciaMap['valor'] = transferencia.valor;
      transferenciaMap['conta'] = transferencia.conta;
      transferenciaMap['nome'] = transferencia.nome;
      list.add(transferenciaMap);
    }
    return await transferenciasCollection.doc(uid)
        .set({
          'transferencias': list,
        }
    );
  }

  Future<List<Transferencia>> getTransferencias() async {
    return await transferenciasCollection.doc(uid).get()
        .then((value) {
      final data = value.data();
      final List<Transferencia> list = [];
      if (data != null){
        for(Map<dynamic, dynamic> map in data['transferencias']) {
          Transferencia transferencia = Transferencia(
              valor: map['valor'],
              conta: map['conta'],
              nome: map['nome']
          );
          list.add(transferencia);
        }
      }
      return list;
    });
  }

}