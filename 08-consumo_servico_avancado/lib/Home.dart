import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Uri _uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

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

  void _post() async{
    http.Response response = await http.post(
      Uri.parse("$_urlBase/posts"),
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: json.encode({
        "userId": 120,
        "id": null,
        "title": "Título",
        "body": "Corpo da postagem"
      })
    );
    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  void _put() async{
    http.Response response = await http.put(
        Uri.parse("$_urlBase/posts/2"),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode({
          "userId": 120,
          "id": null,
          "title": "Título Alterado",
          "body": "Corpo da postagem alterada"
        })
    );
    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  void _patch() async{
    http.Response response = await http.patch(
        Uri.parse("$_urlBase/posts/2"),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: json.encode({
          "body": "Corpo da postagem alterada"
        })
    );
    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  void _delete() async {
    http.Response response = await http.delete(Uri.parse("$_urlBase/posts/2"));
    print("Resposta: ${response.statusCode}");
    print("Resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de Serviço Avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Salvar"),
                    onPressed: _post,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Atualizar"),
                  onPressed: _patch,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Remover"),
                  onPressed: _delete,
                )
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
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
                )
            )
          ],
        ),
      ),
    );
  }
}
