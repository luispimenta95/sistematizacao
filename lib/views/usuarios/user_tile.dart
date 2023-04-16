import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import '../../models/user.dart';
import '../../routes/routes.dart';

class UserTile extends StatelessWidget{
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final selfie  = CircleAvatar(
      child: Icon(Icons.person));

    Widget cancelar = TextButton(
      child: Text("Cancelar"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmar = TextButton(
      child: Text("Sim"),
      onPressed:  () {
        Provider.of<UserProvider>(context,listen: false).deletar(user);
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Excluir usuário"),
      content: Text("Tem certeza?"),
      actions: [
        cancelar,
        confirmar,
      ],
    );
    return ListTile(
      leading: selfie,
      title: Text(user.nome),
      subtitle: Text(user.cpf),
      trailing: Container(
    width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(
                      AppRoutes.USER_FORM,
                    arguments: user
                  );
                },
                icon: Icon(Icons.edit),
                color: Colors.orange,
            ),

            IconButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),


          ],

        ),
    ),
    );
    }


  

}