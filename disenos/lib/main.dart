import 'package:flutter/material.dart';

import 'package:disenos/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'basic_design', 
      routes: {
        'basic_design': ((_) => BasicDesignScreen()),
      },
    );
  }
}