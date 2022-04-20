import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());


// Widget que mantendra el estado de la aplicacion. EN este caso del movies provider
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Por si necesito tener mas de un provider
      providers: [
        ChangeNotifierProvider( // provider de movies
          // La creacion es lo que tengo que ejecutar para crear la primera instancia de mi provider.
          create: ( _ ) => MoviesProvider() ,
          lazy: false, // para que el provider no se cree de manera peresoza (cuando se utilice)
        ),
      ],
      // Luego de iniciar los proveedores llamos a mi aplicacion
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':    ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}