import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> movies;
  final String? title;

  const MovieSlider({
    Key? key,
    required this.movies,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ),

          const SizedBox(height: 5,),

          Expanded( // Expanded es un widget que toma todo el tamanio disponible. lo tengo que poner ya que el column tiene un tamanio dinamico y el list view necesita un tamanio fijo
            child: ListView.builder( // Listview toma el tamanio del padre.
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ( _ , int index) => _MoviePoster(movie: movies[index]),
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

  final Movie movie;

  const _MoviePoster({ 
    Key? key,
    required this.movie 
  }) : super(key: key);

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
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5,),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis, // Si el texto sobrepasa el espacio para renderizarlo lo corta y le pone 3 puntos
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}