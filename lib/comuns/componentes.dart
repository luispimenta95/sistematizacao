import 'package:flutter/material.dart';

class Componentes {
  List<Widget> lista = [

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
  Text( ' Login incorreto !'),
  ],
  ),
  duration: Duration(milliseconds: 1000),
  ),
  AppBar(
  title: Text('Formulário de cadastro' ),
  centerTitle: true,
  )
  ];

List<Widget> recuperaLista(){
  return lista;
  }
}