import 'package:flutter/cupertino.dart';

class User {
  final  String id;
  final  String nome;
  final  String email;
  final  String selfie;

  const User(
      this.id,
      @required this.nome,
      @required this.email,
      @required this.selfie,
      );
}