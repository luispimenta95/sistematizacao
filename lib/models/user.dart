import 'package:flutter/cupertino.dart';

class User {
  final  String id;
  final  String nome;
  final  String cpf;

  const User(
      this.id,
      @required this.nome,
      @required this.cpf
      );
}