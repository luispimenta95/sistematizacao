import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/models/user.dart';
import 'package:sistematizacao/providers/user.dart';

import '../../routes/routes.dart';

class UserHome extends StatefulWidget {



  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<User> filteredItems = [];
  List<User> main = UserProvider().recuperarTodos.toList();
  final selfie = Icon(Icons.person);

  @override
  void initState() {
    super.initState();
    filteredItems = main;
    print('Valor da tela de lista" : ${main.length}');
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

    //Provider.of<UserProvider>(context,listen: false).deletar(user);
    //Navigator.of(context).pop();


    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
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
                  leading: selfie,
                  title: Text(filteredItems[index].nome),
                  subtitle: Text(filteredItems[index].cpf),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.orange,
                        ),

                        IconButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Excluir usuário"),
                                  content: Text("Tem certeza?"),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancelar"),
                                      onPressed:  () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text("Sim"),
                                      onPressed:  () {
                                      },
                                    ),
                                  ],
                                );;
                              },
                            );
                          },
                          icon: Icon(Icons.delete),

                        ),


                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}