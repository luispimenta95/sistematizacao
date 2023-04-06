import 'package:flutter/material.dart';

class Componentes {



  List<Widget> recuperaSnack(String titulo){
  List<Widget>lista = [
    SnackBar

      (

      // background color of your snack-bar
      backgroundColor: Colors.red,
      // make the content property take a Row
      content: Row(
        children: <Widget>[
          // add your preferred icon here
          Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
          ),
          // add your preferred text content here
          Text(titulo),
        ],
      ),
      duration: Duration(milliseconds: 1000),
    )
  ];
  return lista;
  }
List<Widget> recuperaAppBar(String titulo){
  List<Widget>lista = [
  AppBar(
    title: Text(titulo),
    centerTitle: true,
  )
  ];
  return lista;
}
}