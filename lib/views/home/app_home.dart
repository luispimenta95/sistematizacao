import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../data/userFixos.dart';
import '../../models/user.dart';
class AppHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Home page'),
            centerTitle: true,
            actions: <Widget>[


              IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                },
                icon: Icon(Icons.add),
              ),

            ],
          ),

        );
  }

}