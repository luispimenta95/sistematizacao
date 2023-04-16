import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/utils/componentes.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
    final Componentes lista = Componentes();
    List snack = lista.recuperaSnack(' Login incorreto, tente novamente !');
    List apBar = lista.recuperaAppBar('Login Sistematização');
    Future<void> realizarLogin() async{
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _controllerEmail.text,
            password: _controllerSenha.text
        );
        if(userCredential != null){
          Navigator.of(context).pushNamed(
            AppRoutes.APP_HOME,
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(snack[0]);
        _controllerSenha.clear();
        _controllerEmail.clear();
      }
    }

    return Scaffold(
      appBar: apBar[0],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                SizedBox(height: 10),
                TextFormField(
                  controller: _controllerEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe um nome';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe uma senha';
                    }
                    return null;
                  },
                  controller: _controllerSenha,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    realizarLogin();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
