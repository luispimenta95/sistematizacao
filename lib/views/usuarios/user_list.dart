import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../data/userFixos.dart';
import '../../models/user.dart';
class UserList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
        return Scaffold(
          body: ListView.builder(
              itemCount:users.recuperaTotal ,
              itemBuilder: (context,i) => UserTile(users.posicao(i)),
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              },
              tooltip: 'Adicionar usuário',
              child: const Icon(Icons.add),
            )

        );
  }

}