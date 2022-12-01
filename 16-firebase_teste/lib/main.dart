import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Firestore
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Insere dados especificando o ID do documento
  db.collection("users").doc("001").set(
    {"name": "Daniel", "age": "18"},
  );

  // Insere dados e cria um ID de documento aleatório
  DocumentReference docId = await db.collection("news").add(
    {
      "title": "New Crypto!",
      "Description": "Example Text",
    },
  );
  print("DOC ID: ${docId.id}");

  // Remover dados do documento
  db.collection("users").doc("001").delete();

  // Recuperar informações de um documento específico
  DocumentSnapshot snapshot =
      await db.collection("news").doc("t4Fm2wdyUE70ltEmI2JE").get();
  var dados = snapshot.data();
  print(dados);

  // Recuperar informações de uma collection
  QuerySnapshot querySnapshot = await db.collection("news").get();
  print("Dados da Collection: ${querySnapshot.docs.toString()}");

  for(DocumentSnapshot item in querySnapshot.docs){
    var dados = item.data();
    print(dados);
  }

  //Utilizando um Listener
  db.collection("news").snapshots().listen((snapshot) {
    for(DocumentSnapshot item in snapshot.docs){
      var dados = item.data();
      print(dados);
    }
  });

  // Aplicando Filtros
  QuerySnapshot queryFilter = await db.collection("news")
  .where("title", isEqualTo: "Crypto")
  .get();

  for(DocumentSnapshot item in queryFilter.docs){
    var dados = item.data();
    print(dados);
  }

  // Autenticando usuário
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = "daniel@teste.com";
  String pass = "123456";

  auth.createUserWithEmailAndPassword(
    email: email,
    password: pass
  ).then((firebaseUser){
    print("Novo usuário: criado com sucesso! E-mail: ${firebaseUser.user?.email}");
  }).catchError((error){
    print("Novo usuário: erro " + error.toString());
  });

  // Sign out do usuário
  // auth.signOut();

  // Sign in do usuário
  auth.signInWithEmailAndPassword(
      email: email,
      password: pass
  ).then((firebaseUser){
    print("Logar usuário: logado com sucesso! E-mail: ${firebaseUser.user?.email}");
  }).catchError((error){
    print("Logar usuário: erro " + error.toString());
  });

  // Verifica se o usuário está logado
  User? usuarioAtual = await auth.currentUser;
  if(usuarioAtual != null){
    print("Usuário atual logado. E-mail: ${usuarioAtual.email}");
  }else{
    print("Usuário atual não está logado!");
  }

  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}