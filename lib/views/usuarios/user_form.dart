import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../providers/user.dart';

class UserForm extends StatefulWidget {


  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final myForm = GlobalKey<FormState>();
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final Map<String,String> dados ={};
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
                  final User user =
                  User(
                      '',controller1.text, controller2.text
                  );
                  Provider.of<UserProvider>(context, listen: false).realizarCadastro(user);
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
                decoration: InputDecoration(labelText: 'CPF'),
                  keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um CPF';
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
