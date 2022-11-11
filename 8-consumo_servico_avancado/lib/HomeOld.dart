import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomeOld extends StatefulWidget {
  const HomeOld({Key? key}) : super(key: key);

  @override
  State<HomeOld> createState() => HomeOldState();
}

class HomeOldState extends State<HomeOld> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {

    http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));
    var dadosJson = json.decode(response.body);

    List<Post> postagens = [];

    for(var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Consumo de Serviço Avançado"),
        ),
        body: FutureBuilder<List<Post>>(
          future: _recuperarPostagens(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none :
              case ConnectionState.waiting :
                return Center(
                  child: CircularProgressIndicator()
                );
              case ConnectionState.active :
              case ConnectionState.done :
                if(snapshot.hasError){
                  print("Erro ao carregar os dados");
                }else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){
                        List<Post>? lista = snapshot.data;
                        Post post = lista![index];
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.id.toString()),
                        );
                      }
                  );
                }
              break;
            }
            return Center();
          },
        ),
      );
  }
}
