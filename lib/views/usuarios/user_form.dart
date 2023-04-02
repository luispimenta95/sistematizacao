import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserForm extends StatelessWidget{
  final myForm = GlobalKey<FormState>();
  final Map<String,String> dados ={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de cadastro'),
        centerTitle: true,
        actions:<Widget> [
          IconButton(
              onPressed:(){
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
                onSaved: (String? value) {
                  print(value);
                },

              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
              )
            ],
          ),
        ),
      ),
    );
  }

}