import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    title: "Frases do Dia",
    home:
      Row(children: [
        Text("T1"),
        Text("T2"),
        Text("T3")
      ],),
    //home: Container(color: Colors.white,),
  ));

}