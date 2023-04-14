import 'package:cloud_firestore/cloud_firestore.dart';
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
  var bd = FirebaseFirestore.instance.collection('users');

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
      body:StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
        stream: bd.snapshots(),
      builder: (context, snapshot){


          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(

                  child: CircularProgressIndicator()
              );
            case ConnectionState.active:
            case ConnectionState.done:
            if(snapshot.hasData){
              return Text("Dados");


    }
          }
          return Column(
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
                      subtitle: Text(filteredItems[index].email),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: (){
                                final User user = User(filteredItems[index].id, filteredItems[index].nome, filteredItems[index].email, filteredItems[index].selfie);

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
                                            final User exc = User(filteredItems[index].id, filteredItems[index].nome, filteredItems[index].email, filteredItems[index].selfie);
                                            setState(() {
                                              main.removeAt(index);
                                              Navigator.of(context).pop();
                                            });


                                            print(filteredItems.length);
                                          },
                                        ),
                                      ],
                                    );;
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
                  },
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
