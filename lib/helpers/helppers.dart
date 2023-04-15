import 'package:intl/intl.dart';
class Helpers{
  String  recuperarDatas(int tipo){
    DateTime data = DateTime.now();
     String dataFormatada = tipo==1 ? DateFormat('dd/MM/yyyy').format(data):DateFormat('dd/MM/yyyy HH:MM').format(data);
    return dataFormatada;

  }

}