import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/providers/user.dart';
import 'package:sistematizacao/routes/routes.dart';
import 'package:sistematizacao/views/usuarios/user_tile.dart';
import '../../controller/utils.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../data/userFixos.dart';
import '../../models/user.dart';

final Util util = new Util();
Future<List<Moeda>> recuperarDados(http.Client client) async {
  String url = 'https://economia.awesomeapi.com.br/json/daily/USD-BRL/15';
  final response = await client
      .get(Uri.parse(url));
  // Use the compute function to run tratarResposta in a separate isolate.
  return compute(tratarResposta, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Moeda> tratarResposta(String responseBody) {
  final parsed =
  (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

  return parsed.map<Moeda>((json) => Moeda.fromJson(json)).toList();
}

class Moeda {

  final String dataCotacao;
  final String maiorCotacao;
  final String menorCotacao;


  const Moeda({

    required this.dataCotacao,
    required this.maiorCotacao,
    required this.menorCotacao
  });

  factory Moeda.fromJson(Map<String, dynamic> json) {


    return Moeda(



        dataCotacao: json['timestamp'] as String,
        maiorCotacao: json['high'] as String,
        menorCotacao: json['low'] as String
    );
  }


}
class PesquisaQuinzenal extends StatelessWidget{
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('123'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              users.recuperarPesquisa(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

    );
  }

}