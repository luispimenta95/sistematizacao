import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../controller/api.dart';
import '../../data/userFixos.dart';
import '../../models/moeda.dart';
import '../../models/user.dart';
import 'custom_search_delegate.dart';
class PesquisaQuinzenal extends StatelessWidget{
  int _counter = 0;


  String _data = 'Loading...';
  String name = '';
  String maiorCotacao ='';
  String menorCotacao = '';
  bool isLoading = true;

  final ApiMonetizacao api = new ApiMonetizacao();
  final UserProvider provider = UserProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.recuperarNomeMoeda()),
      ),
      body: FutureBuilder<List<Moeda>>(
        future: api.recuperarDados(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return Container(
              child: Center(
                child: Text(provider.recuperarNomeMoeda()),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  List<String> recuperarDados() {
    return [];
  }
}