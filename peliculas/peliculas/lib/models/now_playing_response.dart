// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class NowPlayingResponse {

    NowPlayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    // constructor desde json que crea una instancia de NowPlayingResponse.fromMap basado en un json que recibe como string
    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    // Constructor que toma un json mapeado como string,dynamic y en base a eso se crea una instancia de NowPlayingResponse donde toma los campos del json y los carga a la clase
    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        dates       : Dates.fromMap(json["dates"]),
        page        : json["page"],
        // crea un listado de Movies basado en el campo results. Por cada resultado itera para crearse instancias independientes de movie
        results     : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages  : json["total_pages"],
        totalResults: json["total_results"],
    );

}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

}

