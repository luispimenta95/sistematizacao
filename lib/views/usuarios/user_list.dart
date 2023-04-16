import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
class UserList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
        return Scaffold(
          body: ListView.builder(
              itemCount:users.getAllDocuments('usuarios').toString().length ,
              itemBuilder: (context,i) => UserTile(users.posicao(i)),
          ),


        );
  }

}