import 'package:flutter/material.dart';

import 'package:disenos/screens/screens.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home_screen', 
      routes: {
        'basic_design': ((_) => const BasicDesignScreen()),
        'scroll_screen': ((_) => const ScrollDesignScreen()),
        'home_screen': ((_) => const HomeScreen()),
      },
    );
  }
}