import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  
  void displayDialogIOS(BuildContext context){

    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Esto es para que el tamanio del contenedor lo determinen los hijos
            children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [ // son otros widgets que puedo definir para que el usuario realice acciones
            TextButton(
              onPressed: () => Navigator.pop(context), // Con esta linea, presionando el boton, vuelvo a la pantalla enterior.
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), // Con esta linea, presionando el boton, vuelvo a la pantalla enterior.
              child: const Text('OK'),
            ),
          ]
        );
      },
    );

  }

  void displayDialogAndroid(BuildContext context){

    showDialog(
      // barrierDismissible: true, // Esto nos permite cerrar el dialogo cuando hacemos click en la sombra
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Esto es para que el tamanio del contenedor lo determinen los hijos
            children: const [
              Text('Este es el contenido de la alerta'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [ // son otros widgets que puedo definir para que el usuario realice acciones
            TextButton(
              onPressed: () => Navigator.pop(context), // Con esta linea, presionando el boton, vuelvo a la pantalla enterior.
              child: const Text('Cancelar', style: TextStyle(color: Colors.red),),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), // Con esta linea, presionando el boton, vuelvo a la pantalla enterior.
              child: const Text('Ok'),
            )
          ]
        );
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          // Puedo poner el style para el elevated buttom aca si quiero sobreescribir el general de mi tema
          // style: ElevatedButton.styleFrom(
          //   primary: Colors.red,
          //   shape: const StadiumBorder(),
          //   elevation: 0,
          // ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Mostrar Alerta', style: TextStyle(fontSize: 16)),
          ),
          // Si quiero hacer codigo basado en la plataforma para que el estilo se asemeje mas a la misma:
          onPressed: () => Platform.isAndroid
            ? displayDialogAndroid(context)
            : displayDialogIOS(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context), // Con esta linea, presionando el boton, vuelvo a la pantalla enterior.
      ),
    );
  }
}