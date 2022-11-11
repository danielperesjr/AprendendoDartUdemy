import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  //Comunicação Assíncrona
  _recuperarCep() async{
    String cepDigitado = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${cepDigitado}/json/";

    http.Response response;
    
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${bairro}, ${localidade}";
    });

    // print(
    //   "Resposta logradouro: ${logradouro}, Resposta complemento: ${complemento}, Resposta bairro: ${bairro}, Resposta localidade: ${localidade}"
    // );

    print("Resposta: " + response.statusCode.toString());
    print("Resposta: " + response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviços Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite o CEP:"
                ),
                style: TextStyle(
                  fontSize: 20
                ),
                controller: _controllerCep,
              ),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Clique aqui"),
                  onPressed: _recuperarCep,
              ),
              Text(_resultado)
            ],
          )
      ),
    );
  }
}
