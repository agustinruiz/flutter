import 'package:flutter/material.dart' show IconData, Widget; // Para no importar todo. solo el IconData y los widget

class MenuOption {
  
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption({
    required this.route, 
    required this.icon, 
    required this.name, 
    required this.screen
  });


}