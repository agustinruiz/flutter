import 'package:fl_components/router/app_routes.dart';
import 'package:flutter/material.dart';

import 'screens/screens.dart'; // Con un solo import traigo todos los screens

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      // Para trabajar con rutas creadas de manera dinamica (que no las tengo definidas):
      onGenerateRoute: AppRoutes.onGenerateRoute
    );
  }
}