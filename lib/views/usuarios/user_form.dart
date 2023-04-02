//branch de dev
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistematizacao/models/user.dart';
import 'package:sistematizacao/providers/user.dart';

class UserForm extends StatelessWidget{
  final myForm = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de cadastro' ),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
              onPressed:(){
                bool isValid = myForm.currentState!.validate();
                if(isValid){
                  myForm.currentState!.save();
                  Provider.of<UserProvider>(context, listen: false).put(
                    User(
                        '',controller1.text, controller2.text, ''
                    ),

                  );
                  Navigator.of(context).pop();
                }

              } ,
              icon: Icon(Icons.save))
        ],
      ),
     body: Padding(
       padding: EdgeInsets.all(12),
       child: Form(
         key: myForm,
         child: Column(
           children:<Widget> [
             TextFormField(
               decoration: InputDecoration(labelText: 'Nome'),
               controller: controller1,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Informe um nome';
                 }
                 if (value.length < 6) {
                   return "O nome deve conter ao menos 6 letras";
                 }
                 return null;
               },

             ),
             TextFormField(
               decoration: InputDecoration(labelText: 'E-mail'),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Informe um E-mail';
                 }
                 bool emailValid = RegExp(
                     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                     .hasMatch(value);

                 if (!emailValid) {
                   return 'Informe um E-mail válido';
                 }
                 return null;
               },
               controller: controller2,


             ),

           ],
         ),
       ),
     ),
    );
  }

}