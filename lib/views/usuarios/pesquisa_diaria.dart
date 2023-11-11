import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../controller/api.dart';
import '../../data/userFixos.dart';
import '../../models/user.dart';
import 'custom_search_delegate.dart';
class PesquisaDiaria extends StatelessWidget{
  int _counter = 0;


  String _data = 'Loading...';
  String name = '';
  String maiorCotacao ='';
  String menorCotacao = '';
  bool isLoading = true;

  final ApiMonetizacao api = new ApiMonetizacao();

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(api.sugestoesPesquisa()),
              );
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: api.sugestoesPesquisa().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(api.sugestoesPesquisa()[index]),
            onTap: (){
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(api.sugestoesPesquisa())
              );
            },
          );
        },
      ),
    );
  }
}