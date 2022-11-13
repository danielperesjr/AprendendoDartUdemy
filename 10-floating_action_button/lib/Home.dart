import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("FloatingActionButton"),
      ),
      body: Center(
        child: Text(
            "Conteúdo",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(0)
        // ),
        // mini: true,
        // child: Icon(Icons.add),
        onPressed: (){
          print("Resultado: botão pressionado");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add),
            )
          ],
        )
      ),
    );
  }
}
