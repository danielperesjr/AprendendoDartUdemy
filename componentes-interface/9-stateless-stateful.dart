import 'package:flutter/material.dart';

/*
  Stateless -> Widgets que não podem ser alterados (constantes)
  Stateful -> Widgets que podem ser alterados (variáveis)
 */

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));

}

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key? key}) : super(key: key);

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {

  var _texto = "Primeiro Build";

  @override
  Widget build(BuildContext context) {
    print("Próximo Build!");
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            MaterialButton(
              onPressed: (){
                setState(() {
                  _texto = "Curso Flutter";
                });
              },
              color: Colors.amber,
              child: Text("Clique aqui!"),
            ),
            Text("Nome: $_texto")
          ],
        ),),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instagram"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo Principal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text("Texto 1"),
                Text("Texto 2"),
              ],
            )
        ),
      ),
    );
  }
}