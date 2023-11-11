import 'package:flutter/material.dart';
import 'package:sistematizacao/models/user.dart';
import '../data/userFixos.dart';


class UserProvider with ChangeNotifier{
    String moeda = '';
    String codigoMoeda = '';

    void definirNomeMoeda(String query) {
      moeda = query;
    }
    String recuperarNomeMoeda(){
      notifyListeners();
        return moeda;
    }
    void definirCodigoMoeda(String query) {
      codigoMoeda = query;
    }
    String recuperarCodigoMoeda(){
      notifyListeners();
      return codigoMoeda;
    }

}