import 'package:flutter/material.dart';
import 'package:sistematizacao/models/user.dart';

class UserHome extends StatefulWidget {



  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<User> filteredItems = [];
  List<User> main  =[
    User('1', 'nome', '  email', ''),
    User('2', 'nome', '  email', ''),
    User('3', 'nome', '  email', ''),
    User('4', 'nome', '  email', ''),
    User('5', 'nome', '  email', ''),
  ];
  @override
  void initState() {
    super.initState();
    filteredItems = main;
  }

  void _filterList(String nome) {
    setState(() {
      filteredItems = main.where((element) =>
          element.nome!.toLowerCase().
          contains(nome.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      children: [
        TextField(
          onChanged: _filterList,
          decoration: InputDecoration(
            labelText: 'Pesquisa',
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: filteredItems.length == 0 ?
          Center(child: Text("Sem resultados !")) :
          ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(filteredItems[index].nome),
              );
            },
          ),
        ),
      ],
      ),
    );
  }
}
