import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/views/usuarios/pesquisa_quinzenal.dart';

import '../../controller/api.dart';
import '../../controller/utils.dart';
import '../../providers/user.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> items;
  final ApiMonetizacao api = new ApiMonetizacao();
  final Util util = new Util();

  CustomSearchDelegate(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(context) {
    return FutureBuilder<String>(
        future: api.pesquisarApi(query),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.toLowerCase() == 'ok') {
              return ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.currency_exchange),
                    title: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        api.name),
                  ),
                  ListTile(
                    leading: Icon(color: Colors.green, Icons.arrow_circle_up),
                    title: Text(
                        style: TextStyle(fontWeight: FontWeight.bold),
                        api.maiorCotacao),
                  ),
                  ListTile(
                    leading: Icon(color: Colors.red, Icons.arrow_circle_down),
                    title: Text(api.menorCotacao,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            } else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Nenhum resultado foi encontrado para a moeda:',
                      ),
                      Text(
                        '$query',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? []
        : items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final UserProvider users = Provider.of(context);
    return ListView.builder(

      itemCount: suggestions.length,
      itemBuilder: (context, index) {

        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            // Update the search query when an option is clicked
            query = suggestions[index];
            users.definirNomeMoeda(query);
            print(query);
            users.definirCodigoMoeda(util.coinsOptions[query]!);
            // Close the search and display the selected item
            showResults(context);
          },
        );
      },
    );
  }
}