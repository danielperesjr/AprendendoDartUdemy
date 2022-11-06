import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    title: "Frases do Dia",
    home: Container(
      //color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.all(0),
      //margin: EdgeInsets.only(top: 50, left: 50),
      //margin: EdgeInsets.fromLTRB(10, 60, 30, 40),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.white)
      ),
      child: Row(
        children: [
          Text("T1"),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text("T2"),
          ),
          Text("T3")
          /*Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum posuere rhoncus velit, eget commodo",
              textAlign: TextAlign.justify,
          )*/
        ],
      ),
    ),
  ));

}