import 'package:flutter/material.dart';
import 'package:sistematizacao/models/user.dart';
import '../data/userFixos.dart';


class UserProvider with ChangeNotifier{
    String pesquisa = '';
    void definirPesquisa(String query) {
      pesquisa = query;
    }
    String recuperarPesquisa(){
      notifyListeners();
        return pesquisa;
    }

}