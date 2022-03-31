import 'package:fl_components/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.access_time_outlined),
          title: const Text('Nombre de ruta'),
          onTap: () {
            // Esta es una forma de llamar a otra pantalla
            // final route = MaterialPageRoute(
            //   builder: (context) => const ListView1Screen()
            // );
            // Navigator.push(context, route);

            // otra forma es usando pushNamed
            Navigator.pushNamed(context, 'card2');
          },
        ),
        separatorBuilder: (_ , __) => const Divider(),
        itemCount: 100)
    );
  }
}