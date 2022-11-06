import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    title: "Frases do Dia",
    home: Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "Lorem Ipsum",
            style: TextStyle(
                fontSize: 50,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
                wordSpacing: 0,
                decoration: TextDecoration.underline,
                decorationColor: Colors.greenAccent,
                decorationStyle: TextDecorationStyle.solid,
                color: Colors.black
            ),
          )
        ],
      ),
    ),
  ));

}