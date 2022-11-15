import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';

class HomeBlockchain extends StatefulWidget {
  const HomeBlockchain({Key? key}) : super(key: key);

  @override
  State<HomeBlockchain> createState() => _HomeBlockchainState();
}

class _HomeBlockchainState extends State<HomeBlockchain> {

  Future<Map> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot){

        late String resultado;
        late double valor;

        switch(snapshot.connectionState){
          case ConnectionState.none :
            print("Conexão None");
            resultado = "Tente novamente";
            break;
          case ConnectionState.waiting :
            print("Conexão Waiting");
            resultado = "Carregando...";
            break;
          case ConnectionState.active :
            print("Conexão Active");
            break;
          case ConnectionState.done :
            print("Conexão Done");
            if(snapshot.hasError){
              resultado = "Erro ao carregar os dados";
            }else {
              double valor = snapshot.data!["BRL"]["buy"];
              resultado = "Cotação do Bitcoin: R\$${valor.toString()}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
