import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../data/userFixos.dart';
import '../../models/user.dart';
import 'package:sistematizacao/comuns/componentes.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
    final Componentes lista = Componentes();
    List snack = lista.recuperaSnack('text snack');
    List apBar = lista.recuperaAppBar('text 154');
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: apBar[0],
        body: Padding(
        padding: EdgeInsets.all(12),
    child: Form(
    key: _formKey,
    child: Column(
    children:<Widget> [
    TextFormField(
    decoration: InputDecoration(labelText: 'Nome'),
    controller: _controllerEmail,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Informe um nome';
    }
    if (value.length < 6) {
    return "O nome deve conter ao menos 6 letras";
    }
    return null;
    },

    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'E-mail'),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Informe um E-mail';
    }
    bool emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
    return 'Informe um E-mail válido';
    }
    return null;
    },
    controller: _controllerSenha,


    ),

    ],
    ),
    ),
        ),
    );
  }
}
