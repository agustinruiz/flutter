import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.green;

  static final ThemeData lightTheme = ThemeData.light().
    copyWith( // me copia todo el tema anterior (light) y me sobreescribe lo que le paso
      // Color primario
      primaryColor: primary,
      
      //App Bar theme
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),

      // TextButton theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: primary)
      ),
    );

  static final ThemeData darkTheme = ThemeData.dark().
      copyWith( // me copia todo el tema anterior (dark) y me sobreescribe lo que le paso
        // Color primario
        primaryColor: primary,
        
        //App Bar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        ),

        scaffoldBackgroundColor: Colors.black,
      );

}