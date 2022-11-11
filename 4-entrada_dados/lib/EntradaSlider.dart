import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  double _valor = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Entrada de Dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                label: _valor.toString(),
                divisions: 5,
                activeColor: Colors.red,
                inactiveColor: Colors.purple,
                onChanged: (double novoValor) {
                  setState(() {
                    _valor = novoValor;
                  });
                  print("Valor selecionado slider: " + novoValor.toString());
                }
            ),
            MaterialButton(
              color: Colors.blue,
                textColor: Colors.white,
                child: Text("Salvar"),
                onPressed: (){
                  print("Valor selecionado botão: " + _valor.toString());
                }
            )
          ],
        ),
      )
    );
  }
}
