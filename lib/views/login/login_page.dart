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
    List listaComponentes = lista.recuperaLista();
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        body:
        Form(

      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _controllerEmail,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _controllerSenha,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          // Add TextFormFields and ElevatedButton here.
          ElevatedButton(
            onPressed: () {
              bool logado = users.loginSistema(_controllerEmail.text, _controllerSenha.text);
              if(!logado){
                ScaffoldMessenger.of(context).showSnackBar(
                    listaComponentes[0]

                );
              }
              else {
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME_USER);
              }
            },
            child: const Text('Submit'),
          ),

        ],
      ),
        ),
    );
  }
}
