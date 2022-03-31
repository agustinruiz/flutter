import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
   
  const ListView1Screen({Key? key}) : super(key: key);

  final options = const['Megaman','Metal Gear','Super Smash','Final Fantasy'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 1'),
      ),
      body: ListView(
        children: [
          // options.map devuelve un iterable. con el toList se devuelve una lista pero el children no puede ser una lista
          // el children tiene que ser una serie de elementos separados por coma.
          // Para ello uso el operador spread '...' que son los tres puntos. que extrae todos los elementos de la lista
          ...options.map(
            (game) => ListTile(
              leading: const Icon(Icons.accessibility_outlined),
              title: Text(game),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            )
          ).toList(),
        ],
      ),
    );
  }
}