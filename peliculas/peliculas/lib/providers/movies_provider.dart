import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

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

}