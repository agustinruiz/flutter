import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),

          const SizedBox(height: 5,),

          Expanded( // Expanded es un widget que toma todo el tamanio disponible. lo tengo que poner ya que el column tiene un tamanio dinamico y el list view necesita un tamanio fijo
            child: ListView.builder( // Listview toma el tamanio del padre.
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ , int index) => const _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}

// Creo un nuevo widget para emprolijar el codigo.
// Se nombra con guion bajo ya que solo se usa aca
class _MoviePoster extends StatelessWidget {
  const _MoviePoster({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'), // navego a la otra pantalla (details)
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5,),

          const Text(
            'Star Wars el regreso de los jedi',
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Si el texto sobrepasa el espacio para renderizarlo lo corta y le pone 3 puntos
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}