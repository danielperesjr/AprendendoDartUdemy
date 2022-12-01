import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
  String _statusUpload = "Upload não iniciado";
  String _urlImagemRecuperada = "";

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

  Future _uploadImagem() async {
    //Referenciar arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference rootFolder = storage.ref();
    Reference file = rootFolder.child("fotos").child("foto1.jpg");

    //Fazer upload da imagem
    UploadTask task = file.putFile(_imagem);

    //Controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if (taskSnapshot.state == TaskState.running) {
        setState(() {
          _statusUpload = "Em progresso";
        });
      } else if (taskSnapshot.state == TaskState.success) {
        _recuperarUrlImagem(taskSnapshot);
        setState(() {
          _statusUpload = "Upload realizado com sucesso!";
        });
      }
    });
  }

  Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {
    String url = await taskSnapshot.ref.getDownloadURL();
    print("resultado url: " + url);

    setState(() {
      _urlImagemRecuperada = url;
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
              Text(_statusUpload),
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
              _imagem == null
                  ? Container()
                  : ElevatedButton(
                      onPressed: () => _uploadImagem(),
                      child: Text("Upload Storage"),
                    ),
              _urlImagemRecuperada == ""
                  ? Container()
                  : Image.network(_urlImagemRecuperada)
            ],
          ),
        ),
      ),
    );
  }
}
