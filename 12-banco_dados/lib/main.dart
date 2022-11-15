import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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

  Future<Database> _recoveryDataBase() async {
    final pathDataBase = await getDatabasesPath();
    final dataBase = join(pathDataBase, "dataBase.db");
    var queryReturn = await openDatabase(
      dataBase,
      version: 1,
      onCreate: (db, dbRecentVersion){
        String sql =
            "CREATE TABLE tbusuario (idusuario INTEGER PRIMARY KEY AUTOINCREMENT, nmusuario VARCHAR, idade INTEGER)";
        db.execute(sql);
      }
    );
    return queryReturn;
    // print("Aberto: " + queryReturn.isOpen.toString());
  }

  void _save() async {
    Database db = await _recoveryDataBase();
    Map<String, dynamic> userData = {
      "nmusuario" : "Maria",
      "idade" : 23
    };
    int id = await db.insert("tbusuario", userData);
    print("Salvo: $id");
  }

  void _listUser() async{
    Database db = await _recoveryDataBase();
    String sql =
        "SELECT * FROM tbusuario";
    List users = await db.rawQuery(sql);
    for(var user in users){
      print(
        "id: " + user['idusuario'].toString() +
          " nome: " + user['nmusuario'] +
            " idade: " + user['idade'].toString()
      );
    }
  }

  void _listUserById(int id) async {
    Database db = await _recoveryDataBase();
    List users = await db.query(
      "tbusuario",
      columns: ["idusuario", "nmusuario", "idade"],
      where: "idusuario = ?",
      whereArgs: [id]
    );

    for(var user in users){
      print(
          "id: " + user['idusuario'].toString() +
              " nome: " + user['nmusuario'] +
              " idade: " + user['idade'].toString()
      );
    }
  }

  void _deleteUser(int id) async {
    Database db = await _recoveryDataBase();
    int recovery = await db.delete(
      "tbusuario",
      where: "idusuario = ?",
      whereArgs: [id]
    );
    print("Item qtd removida: $recovery");
  }

  void _updateUser(int id) async {
    Database db = await _recoveryDataBase();
    Map<String, dynamic> userData = {
      "nmusuario" : "Daniel",
      "idade" : "18"
    };
    int recovery = await db.update(
        "tbusuario",
        userData,
        where: "idusuario = ?",
        whereArgs: [id]
    );
    print("Item qtd atualizada: $recovery");
  }

  @override
  Widget build(BuildContext context) {
    // _save();
    _listUser();
    // _listUserById(1);
    // _deleteUser(4);
    // _updateUser(1);
    _listUser();
    return Container();
  }
}
