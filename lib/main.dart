import 'package:flutter/material.dart';
import 'views/usuarios/myapp.dart';
import 'package:mysql1/mysql1.dart/';
 void main() async {
  var conn = await MySqlConnection.connect(
      ConnectionSettings(
          host: 'localhost',
          port: 3306,
          user: 'root',
          password: '',
          db: 'dart'
      ),
  );
  var resultado = await conn.query("Select * from usuarios");
  print(resultado);
  runApp(const MyApp());
}


