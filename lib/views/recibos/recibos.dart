import 'package:flutter/material.dart';
import 'package:sistematizacao/helpers/helppers.dart';
import 'package:sistematizacao/models/user.dart';
import 'package:sistematizacao/providers/user.dart';


class Recibos extends StatefulWidget {



  @override
  _RecibosState createState() => _RecibosState();
}

class _RecibosState extends State<Recibos> {
  List<User> filteredItems = [];
  List<User> main = UserProvider().recuperarTodos.toList();
  final selfie = Icon(Icons.picture_as_pdf);
  final helpper = Helpers();

  @override
  void initState() {
    super.initState();
    filteredItems = main;
  }



  @override
  Widget build(BuildContext context) {

    //Provider.of<UserProvider>(context,listen: false).deletar(user);
    //Navigator.of(context).pop();


    return Scaffold(
      body:Column(
        children: [
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
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text('Nome : Nome de cliente'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.monetization_on),
                                      title: Text('Valor: R\$ 100,00'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.list_alt_outlined),
                                      title: Text('Serviço prestado : Limpeza dental'),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.calendar_month),
                                      title: Text(helpper.recuperarDatas(1)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.remove_red_eye),

                        ),

                        IconButton(
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Enviar recibo"),
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
                                      onPressed:  (){
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
      ),
    );
  }
}
