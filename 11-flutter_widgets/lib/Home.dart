import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _list = ["Daniel", "Maria", "João", "Pedro"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
                itemBuilder: (context, index){
                final item = _list[index];
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.delete,
                              color: Colors.white
                          )
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white
                          )
                        ],
                      ),
                    ),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction){
                      if(direction == DismissDirection.endToStart){
                        print("Direção: endToStart");
                      }else if(direction == DismissDirection.startToEnd){
                        print("Direção: startToEnd");
                      }
                      setState(() {
                        _list.removeAt(index);
                      });
                    },
                      key: Key(item),
                      child: ListTile(
                        title: Text(item)
                      ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
