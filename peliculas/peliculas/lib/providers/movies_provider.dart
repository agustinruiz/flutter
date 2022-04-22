import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';

// para que pueda ser un provider tiene que extender a ChangeNotifier
class MoviesProvider extends ChangeNotifier{

  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '7c6e238e2b573cca7093a37150f73316';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  // mapa donde voy a ir guardando todos los actores de cada pelicula. int es el id de la pelicula. los dejo en memoria a medida que los necesito
  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0; // al ponerle _ especifico que es una propiedad privada

  // Creo un debouncer de 500ms. o sea que si no se llamo al set value del debouncer se ejecuta la funcion onValue
  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  // el StreamController es como un Future que va a estar emitiendo valores. en este caso una lista de Movie
  final StreamController<List<Movie>> _suggestionsStremController = StreamController.broadcast(); //hago el broadcast ya que muchos objetos pueden estar suscriptos a los cambios de este stream
  Stream<List<Movie>> get suggestionStream => _suggestionsStremController.stream; // este es el stream que escuchare desde el stream builder


  MoviesProvider(){
    print('Movies provider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    var url = Uri.https( _baseUrl , endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  void getOnDisplayMovies() async{
    final jsonData = await _getJsonData('/3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    // Una vez que actualice los datos aviso a los listeners para que redibujen la pantalla
    notifyListeners(); // Notifica a los widgets

  }

  void getPopularMovies() async{
    _popularPage++;

    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    // En esta busqueda voy a ir agregando las peliculas de las busquedas de otras paginas.
    // Los ... desestructura la lista (extrae todos sus componentes)
    // Al ponerlo entre corchetes la vuelvo a formar pero le concateno la lista que tenia antes
    popularMovies = [ ...popularMovies, ...popularResponse.results ];

    // Una vez que actualice los datos aviso a los listeners para que redibujen la pantalla
    notifyListeners(); // Notifica a los widgets
  }

  Future<List<Cast>> getMovieCast( int movieId) async {

    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    // Lo guardo en memoria para no consultar en futuros detalles de la pelicula
    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https( _baseUrl , '/3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }

  // Metodo que mete el valor del quiery al stream cuando el debouncer emite (la persona deja de escribir)
  // Este metodo se ejecuta cada vez que el usuario toca una tecla en el buscador.
  void getSuggestionsByQuery(String searchTerm){

    // inicializo el valor del debouncer en un string vacio
    debouncer.value = '';
    // la funcion asincrona que se llamara al pasar los 500ms sin que el usuario haga nada sera:
    debouncer.onValue = (value) async {
      // a los 500ms sin que el usuario no haga nada realizo la consulta http
      final results = await searchMovies(value);
      _suggestionsStremController.add(results); // le aviso al stream que los resultados cambiaron

    };

    // implemento un timer periodico para actualizar el valor del debouncer con lo que el usuario ingreso en el buscador
    final timer = Timer.periodic(const Duration(milliseconds: 300), ( _ ) { 
      debouncer.value = searchTerm; // a los 300ms el value se actualizara con el valor del searchTerm
    });

    // Tengo que cancelar el timer anterior si se vuelve a recibir un valor.
    // Si pasan 301 milisegundos cancelo el timer anterior para que no se siga repitiendo cada 300ms
    Future.delayed(const Duration(milliseconds: 301)).then(( _ ) => timer.cancel());
  }

//  Si el usuario deja de tocar, esta funcion se deja de llamar, se actualiza el valor, se cancela la periodicidad y a los 500ms se hace el query http.
}