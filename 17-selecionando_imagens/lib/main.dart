import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic _imagem;

  Future _recuperarImagem(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? imagemSelecionada;

    if (isCamera) {
      imagemSelecionada = await picker.pickImage(source: ImageSource.camera);
    } else {
      imagemSelecionada = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _imagem = File(imagemSelecionada!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionando Imagens"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _recuperarImagem(true);
                },
                child: Text("Câmera"),
              ),
              ElevatedButton(
                onPressed: () {
                  _recuperarImagem(false);
                },
                child: Text("Galeria"),
              ),
              _imagem == null ? Container() : Image.file(_imagem),
            ],
          ),
        ),
      ),
    );
  }
}
