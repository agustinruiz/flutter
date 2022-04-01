import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10,), // Agrego una separacion entre tarjetas
          CustomCardType2(name: 'Un Hermoso Paisaje', imageUrl: 'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg',),
          SizedBox(height: 10,), // Agrego una separacion entre tarjetas
          CustomCardType2(imageUrl: 'https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=0%2C62%2C3200%2C1552&q=45&auto=format&w=1356&h=668&fit=crop',),
          SizedBox(height: 10,), // Agrego una separacion entre tarjetas
          CustomCardType2(imageUrl: 'https://d36tnp772eyphs.cloudfront.net/blogs/1/2015/04/Mount-Taranaki-volcano-in-New-Zealand.jpg',),
        ],
      )
    );
  }
}

