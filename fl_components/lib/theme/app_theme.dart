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

      // Floating Buttoms
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        elevation: 5,
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primary,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
      ),

      // Input Theme
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10),)
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10),)
        ),

        border: OutlineInputBorder( // se aplica a todos los inputs que no esten habilitados y no especifiquen el border
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10),)
        ),

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