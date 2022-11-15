import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _textoSalvo = "Não há dados disponíveis.";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("localData", valorDigitado);
    print("operação (salvar): ${valorDigitado}");
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("localData") ?? "Sem valor";
    });
    print("operação (recuperar): $_textoSalvo");
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("localData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo:"
              ),
              controller: _controllerCampo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                        "Salvar",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    onPressed: _salvar,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recuperar",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _recuperar,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Remover",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
