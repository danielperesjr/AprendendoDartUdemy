import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens() {
    for (int i = 0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem Ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} Lorem Ipson dolor sit amet.";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
      title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){
              return ListTile(
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          title: Text(_itens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.blue
                          ),
                          content: Text(_itens[indice]["descricao"]),
                          contentTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                          actions: [
                            MaterialButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Sim"),
                                onPressed: (){
                                  print("Selecionado sim");
                                  Navigator.pop(context);
                                }
                            ),
                            MaterialButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text("Não"),
                                onPressed: (){
                                  print("Selecionado não");
                                  Navigator.pop(context);
                                }
                            )
                          ],
                        );
                      }
                  );
                },
                onLongPress: (){

                }
              );
            }
        ),
      ),
    );
  }
}
