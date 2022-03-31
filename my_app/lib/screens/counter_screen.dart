
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  // El key es algo que me sirve para identificar este widget dentro del contexto
  const CounterScreen({Key? key}) : super(key: key);

  // El satefulwidget en lugar del metodo build tiene la creacion del estado. El cual regresa inmediatamente
  // Una nueva instancia de _CounterScreenState
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  // Para que se tome esta variable como de estado tiene que ser una propiedad de la clase.
  int counter = 10;

  void increase(){
    counter++;
    setState(() {});
  }

  void decrease(){
    counter--;
    setState(() {});
  }

  void reset(){
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30,);

    // el build context es todo mi arbol de widgets. en este punto conoce toda la decendencia hasta este punto
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Counter Screen'),
        elevation: 0,
      ), 

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Para centrarlo de manera vertical
          children: <Widget>[ // Le estoy diciendo que tiene que ser un listado de widgets constantes
            const Text('Numero de clicks', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      
      // Construccion de los botones
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [ // el row recibe una lista de widgets como childrens
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1_outlined),
          // en onPressed es una funcion que devuelve el resultado de setState que recibe una funcion para actualizar el estado
          onPressed: () => increaseFn(),
        ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_zero_outlined),
          onPressed: () => resetFn(),
        ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn(),
        ),
      ],
    );
  }
}