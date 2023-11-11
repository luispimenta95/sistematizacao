

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/controller/utils.dart';

import '../models/moeda.dart';
import '../providers/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class ApiMonetizacao{

  String maiorCotacao = '';
  String menorCotacao = '';
  String name = '';
  bool isLoading = true;
  final Util util = new Util();
  final UserProvider provider = UserProvider();




  Future<String> pesquisarApi(String query) async {
    String? moeda = util.coinsOptions[query];
    const String pais = 'BRL';

    String url = 'http://economia.awesomeapi.com.br/json/last/$moeda-$pais';


    final response = await util.makeRequest(url);
    if (response['status'] != 404) {

      name = response['$moeda$pais']['name'];
      maiorCotacao = util.formatarMoeda(response['$moeda$pais']['high']);
      menorCotacao = util.formatarMoeda(response['$moeda$pais']['low']);
      return 'Ok';
    } else {
      return 'Erro';
    }
  }

  List<String> sugestoesPesquisa(){
    return
      [
        'Bitcoin',
        'Dirham dos Emirados',
        'Dólar Americano',
        'Dólar Canadense',
        'teste erro'

      ];
  }

  Future<List<Moeda>> recuperarDados() async {
    String moeda = provider.recuperarCodigoMoeda();
    print(moeda);
    String url = 'https://economia.awesomeapi.com.br/json/daily/$moeda-BRL/15';
    final response = await http.Client()
        .get(Uri.parse(url));
    print(response.body);
    // Use the compute function to run tratarResposta in a separate isolate.
    return compute(tratarResposta, response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<Moeda> tratarResposta(String responseBody) {
    final parsed =
    (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Moeda>((json) => Moeda.fromJson(json)).toList();
  }


}