import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/home/app_home.dart';

import 'package:sistematizacao/views/usuarios/user_form.dart';
import 'pesquisa_quinzenal.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(
              create: (context) => UserProvider()
          )

        ],
      child:
      MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        routes: {
            AppRoutes.HOME : (_) =>  AppHome(),
            AppRoutes.USER_FORM : (_) => UserForm(),


        },
      ),
    );

  }
}