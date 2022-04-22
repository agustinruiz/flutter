

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // el metodo close viene gracias al search delegate y es para cerrar la ventana de busqueda y volver a la pantalla anterior
        close(
          context,
          null // Result es lo que quiero regresar de la llamada a este widget. En este caso no devuelvo nada
        );
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Build Result');
  }

  Widget _emptyContainer(){
      return Container(
        child: const Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130,),
        ),
      );
  }

  ///Esta funcion se llama cada vez que el usuario presione una tecla
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){ // query es el string que se va escribiendo en el buscador
      return _emptyContainer();
    }
    // me traigo el provider o el servicio de movies para que vaya a buscar la info
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false); // listen en false para que no se pase redibujando de manera innecesaria
    
    moviesProvider.getSuggestionsByQuery(query); // obtengo las sugerencias en base al debouncer

//    return FutureBuilder( cambio el future builder por un stream builder ya que necesito poder frenar su ejecucion dependiendo del bouncer
//      future: moviesProvider.searchMovies(query),
    return StreamBuilder( // El stream builder unicamente se redibujara cuando el moviesProvider.suggestionStream emite un valor
      stream: moviesProvider.suggestionStream, // escucho el suggestions stream
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data;

        return ListView.builder(
          itemCount: movies != null ? movies.length : 0,
          itemBuilder: (_ , int index) => _MovieItem(movie: movies![index]),
        );
      },
    );
  }

}

class _MovieItem extends StatelessWidget {

final Movie movie;

  const _MovieItem({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),

      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie );
      },
    );
  }
}