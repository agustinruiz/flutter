import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {

  const CustomCardType2({
    Key? key, 
    required this.imageUrl, 
    this.name
  }) : super(key: key);

  final String imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, // Esto me sirve para lo que se contenga se ajuste a la forma del widget. lo que sobra lo corta. con esto ajusto los bordes redondeados
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      shadowColor: AppTheme.primary.withOpacity(0.5),
      elevation: 30,
      child: Column(
        children: [

          // Widget que sirve para mostrar imagenes
          FadeInImage(
            image:  NetworkImage(imageUrl), 
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity, // Esto es para que se ajuste a todo el ancho posible. funciona en widgets donde el ancho es limitado
            height: 230,
            fit: BoxFit.cover, // Para que la imagen cubra todo el widget
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          if (name != null) // Forma que tiene flutter para no mostrar un widget si no se cumple tal condicion
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(name ?? 'No Title'),
            ),
          

        ],
      ),
    );
  }
}