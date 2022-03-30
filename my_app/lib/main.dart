//import 'package:flutter/cupertino.dart'; cupertino son libreria mas personalizadas para IOS pero anda igual que material
import 'package:flutter/material.dart';

import 'package:my_app/screens/home_screen.dart';

// Funcion principal por la cual comienza mi programa
void main(){
  // Lo primero que hago es correr mi aplicacion de flutter con runApp
  runApp(const MyApp()); // lo que le paso para correr es el widget principal. si no varia se recomienda que sea constante
}

// Widget principal
class MyApp extends StatelessWidget {
  // Constructor de mi clase
  const MyApp({
    Key? key
    }) : super(key: key);

  // Todo stateless widget necesita definir el metodo build
  @override
  Widget build(BuildContext context) {
    // En la ultima version de flutter nos recomienda trabajar con constantes en los widgets que no van a cambiar
    // para que la aplicacion sea mas rapida. Para ello agrego la palabra const.
    // Se aconseja que sea el padre o el ancestro mas alto el que tenga la palabra const. el resto lo hereda
    return const MaterialApp( // tengo que devolver el widget a mostrar que es un encadenamiento de widgets
      debugShowCheckedModeBanner: false, // para sacar el banner de debug
      home: HomeScreen()
    );
  }
}