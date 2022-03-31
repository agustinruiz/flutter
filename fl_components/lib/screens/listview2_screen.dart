import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
   
  const ListView2Screen({Key? key}) : super(key: key);

  final options = const['Megaman','Metal Gear','Super Smash','Final Fantasy'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 2'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, i) => ListTile(
            leading: const Icon(Icons.accessibility_outlined, color: Colors.indigo,),
            title: Text(options[i]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              final game = options[i];
              print(game);
            },
         ),
        separatorBuilder: (_, __) => const Divider(),

      ),
    );
  }
}