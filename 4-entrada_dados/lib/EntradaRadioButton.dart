import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  const EntradaRadioButton({Key? key}) : super(key: key);

  @override
  State<EntradaRadioButton> createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [

            RadioListTile(
                title: Text("Masculino"),
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (dynamic escolha){
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }
            ),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (dynamic escolha){
                  setState(() {
                  _escolhaUsuario = escolha;
                  });
                }
            ),
            RadioListTile(
                title: Text("Teste"),
                value: "t",
                groupValue: _escolhaUsuario,
                onChanged: (dynamic escolha){
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }
            ),
            MaterialButton(
              color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                    "Salvar",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                onPressed: (){
                  print("Resultado: " + _escolhaUsuario.toString());
                }
            ),

            // Text("Masculino"),
            // Radio(
            //     value: "m",
            //     groupValue: _escolhaUsuario,
            //     onChanged: (dynamic escolha){
            //       setState(() {
            //         _escolhaUsuario = escolha;
            //       });
            //       print("Resultado: " + escolha);
            //     }
            // ),
            // Text("Feminino"),
            // Radio(
            //     value: "f",
            //     groupValue: _escolhaUsuario,
            //     onChanged: (dynamic escolha){
            //       setState(() {
            //         _escolhaUsuario = escolha;
            //       });
            //       print("Resultado: " + escolha);
            //     }
            // ),

          ],
        ),
      ),
    );
  }
}
