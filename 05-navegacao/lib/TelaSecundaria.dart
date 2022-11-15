import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  var valor;
  TelaSecundaria({this.valor});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundária"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            // Text("Segunda Tela, valor passado: ${widget.valor}")
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Ir para a primeira tela"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                Navigator.pushNamed(context, "/");
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => TelaSecundaria("Daniel")
                //     )
                // );
              },
            )
          ],
        ),
      ),
    );
  }
}
