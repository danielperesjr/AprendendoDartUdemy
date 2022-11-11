import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  bool _escolhaConfig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Entrada de Dados"),
      ),
      body: Container(
        child: Column(
          children: [

            SwitchListTile(
              activeColor: Colors.green,
              selected: false,
              secondary: Icon(Icons.add_alert),
              title: Text("Receber Notificações?"),
                value: _escolhaUsuario,
                onChanged: (bool valor){
                  setState(() {
                    _escolhaUsuario = valor;
                  });
                }
            ),
            SwitchListTile(
                activeColor: Colors.green,
                selected: false,
                secondary: Icon(Icons.add_a_photo),
                title: Text("Carregar imagens automaticamente?"),
                value: _escolhaConfig,
                onChanged: (bool valor){
                  setState(() {
                    _escolhaConfig = valor;
                  });
                }
            ),

            // Switch(
            //     value: _escolhaUsuario,
            //     onChanged: (bool valor){
            //       setState(() {
            //         _escolhaUsuario = valor;
            //       });
            //     }
            // ),
            // Text("Receber Notificações?"),
            
            MaterialButton(
              color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 18
                  )
                ),
                onPressed: (){
                  print("Resultado: " + _escolhaUsuario.toString());
                  print("Resultado 2: " + _escolhaConfig.toString());
                }
            )

          ],
        ),
      ),
    );
  }
}
