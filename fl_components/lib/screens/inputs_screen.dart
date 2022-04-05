import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // Creo una key para referenciar a mi formulario
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Agustin',
      'last_name' : 'Ruiz',
      'email'     : 'agusruiz@gmail.com',
      'password'  : '123346',
      'role'      : 'admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs and Forms'),
      ),
      body: SingleChildScrollView( // Permite tener una ventana en la cual hacer scroll
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey, // le asigno la key para identificar al formulario
          child: Column(
            children: [
              CustomInputField(labelText: 'Nombre', hintText: 'Nombre de Usuario', formProperty: 'first_name', formValues: formValues,),
              const SizedBox(height: 30,),
        
              CustomInputField(labelText: 'Apellido', hintText: 'Apellido de Usuario', formProperty: 'last_name', formValues: formValues,),
              const SizedBox(height: 30,),
        
              CustomInputField(labelText: 'Correo', hintText: 'Correo de Usuario', keyboardType: TextInputType.emailAddress,formProperty: 'email', formValues: formValues,),
              const SizedBox(height: 30,),
        
              CustomInputField(labelText: 'Clave', hintText: 'Clave del usuario', obscureText: true,formProperty: 'password', formValues: formValues,),
              const SizedBox(height: 30,),
        
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                  DropdownMenuItem(value: 'Superuser', child: Text('Superuser')),
                  DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                  DropdownMenuItem(value: 'Jr. Developer', child: Text('Jr. Developer')),
                ],
                onChanged: (value) {
                  formValues['role'] = value ?? 'Admin';
                }
              ),

              ElevatedButton(
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(child: Text('Guardar'))
                ),
                onPressed: () {
                  // Para minimizar el teclado lueo de apretar el boton de guardar
                  FocusScope.of(context).requestFocus(FocusNode());

                  // Valido todos los inputs del formulario
                  if (!myFormKey.currentState!.validate()){
                    print('Fromulario no valido');
                  }
                  // * Imprimir valores para el formulario
                  print(formValues);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

