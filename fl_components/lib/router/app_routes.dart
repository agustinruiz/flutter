import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_filled),
    MenuOption(route: 'listview1', name: 'List View tipo 1', screen: const ListView1Screen(), icon: Icons.list_alt),
    MenuOption(route: 'listview2', name: 'List View tipo 2', screen: const ListView2Screen(), icon: Icons.list),
    MenuOption(route: 'alert', name: 'Alerts', screen: const AlertScreen(), icon: Icons.add_alert),
    MenuOption(route: 'card', name: 'Cards', screen: const CardScreen(), icon: Icons.credit_card),
    
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    // Inicializo la lista que contendra las rutas
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    // Cargo las rutas a la lista
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  // Esta es otra forma de poner las rutas
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home'     : ( BuildContext context ) => const HomeScreen(),
  //   'listview1': ( BuildContext context ) => const ListView1Screen(),
  //   'listview2': ( BuildContext context ) => const ListView2Screen(),
  //   'alert'    : ( BuildContext context ) => const AlertScreen(),
  //   'card'     : ( BuildContext context ) => const CardScreen(),
  // };

  static Route<dynamic> onGenerateRoute ( RouteSettings settings) { // En esta funcion vemos que queremos hacer en base a la ruta dinamica
        // En este caso devuelvo una ruta a la pagina de alertas
        return MaterialPageRoute(
          builder: (context) => const AlertScreen(),
        );
  }
}