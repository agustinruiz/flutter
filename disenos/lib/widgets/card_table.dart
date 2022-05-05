import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table( // El table funciona como una coleccion de rows. Todos los rows tienen que tener la misma cantidad de hijos
      children: const [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.border_all, text: 'General'),
            _SingleCard(color: Colors.red, icon: Icons.car_rental, text: 'Transport'),
          ],
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.green, icon: Icons.shop, text: 'Shopping'),
            _SingleCard(color: Colors.yellow, icon: Icons.cloud, text: 'Bill'),
          ],
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.deepPurple, icon: Icons.movie, text: 'Enterteiment'),
            _SingleCard(color: Colors.orange, icon: Icons.food_bank, text: 'Grocery'),
          ],
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.grey, icon: Icons.share, text: 'Share'),
            _SingleCard(color: Colors.pink, icon: Icons.medical_services, text: 'Medical'),
          ],
        ),

      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({ 
    Key? key, 
    required this.icon, 
    required this.color, 
    required this.text 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, size: 35,),
            radius: 30,
          ),
          const SizedBox(height: 10,),
          Text(text, style: TextStyle(color: color, fontSize: 18),)
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({ 
    Key? key, 
    required this.child 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect( // Me ayuda a que el blur no se escape de lo que son las single cards
      borderRadius: BorderRadius.circular(20),
        child: BackdropFilter( // el backdrop filter me permite agregar un blur 
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(66, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,            
          ),
        ),
      ),
    );  
  }
}