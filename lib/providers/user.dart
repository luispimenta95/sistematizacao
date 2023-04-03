import 'package:flutter/material.dart';
import 'package:sistematizacao/models/user.dart';
import '../data/userFixos.dart';


class UserProvider with ChangeNotifier{
  Map<String, User> users = { ...DADOS};

  List<User> get recuperarTodos{
    return [...users.values];
  }
  int get recuperaTotal{
    return users.length;
  }
  User posicao(int i ){
    return users.values.elementAt(i);

}
  void put (User user){
    if(user ==null){
      return;

    }
    if(user.id.trim().isNotEmpty && user.id !=null && users.containsKey(user.id)){
      users.update(user.id, (_) => User(
          user.id, user.nome, user.email, user.selfie)
      );

    }else {
      final id = (recuperaTotal + 1).toString();
      users.putIfAbsent(id, () => User(
          id,user.nome, user.email, user.selfie
      ));
    }
    notifyListeners();
  }
  void deletar(User user) {
    if (user.id
        .trim()
        .isNotEmpty && user.id != null) {
      users.remove(user.id);
      notifyListeners();
    }
  }
    void salvar(_keyForm){
        _keyForm.currentState.save();
        notifyListeners();
    }
    bool loginSistema(String nome, String senha){
      if (nome!='teste' && senha !='123'){
        return false;
      }
      return true;
    }

}