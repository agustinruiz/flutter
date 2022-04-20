import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({ 
    Key? key,
    required this.movies 
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    return Container(
      width: double.infinity, // que tome todo el ancho del padre posible
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {

          final movie = movies[index];

          return GestureDetector( // para poder detectar cuando alguien haga click (ontap)
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'), // navego a la otra pantalla (details)
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Para redondear los bordes
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}