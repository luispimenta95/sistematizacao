import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/views/login/login_page.dart';
import 'package:sistematizacao/views/recibos/recibos.dart';
import 'package:sistematizacao/views/usuarios/user_form.dart';
import 'package:sistematizacao/views/usuarios/user_list.dart';

import '../recibos/recibos.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> tabs = [
    UserForm(),
    Recibos()


  ];
  UserProvider up = UserProvider();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuários',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Recibos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
                () async {
  List<DocumentSnapshot> documents = await up.getAllDocuments('usuarios');
  print(documents.length.toString());
              _selectedIndex = index;
            },
          );
        },
      ),
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
    );
  }


}
