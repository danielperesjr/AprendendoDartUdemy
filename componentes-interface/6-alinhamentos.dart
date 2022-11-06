import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: "Frases do Dia",
    home: Container(
      margin: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.white)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("T1"),
          Text("T2"),
          Text("T3"),
        ],
      ),
    ),
  ));

}