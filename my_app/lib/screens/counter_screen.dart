
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

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30,);

    // el build context es todo mi arbol de widgets. en este punto conoce toda la decendencia hasta este punto
    return Scaffold(
      //backgroundColor: Colors.indigo,
      // El appBar no puede ser constante ya que va a variar durante la ejecucion de la aplicacion
      // Por lo tanto sus padres tampoco
      appBar: AppBar( 
        title: const Text('Counter Screen'),
        elevation: 0,
      ), // Necesita que se le pase un widget especial (PreferredSizedWidget)
      // Si quiero colocar mas de un hijo en este widget tengo que colocar otro widget que me permita agruparlos en orden
      // en este caso el widget column me permite agregarlos uno abajo del otro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Para centrarlo de manera vertical
          //crossAxisAlignment: CrossAxisAlignment.center, // Es para alinear los hijos relativamente al widget de mayor tamano
          children: <Widget>[ // Le estoy diciendo que tiene que ser un listado de widgets constantes
            const Text('Numero de clicks', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      
      // Construccion de los botones
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ // el row recibe una lista de widgets como childrens
          FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () {
              counter++;
              // Esta funcion le dice al framework que un estado cambio y tiene que redibujar el widget de nuevo
              setState(() {}); // Recibe una funcion que a veces se usa para ubicar los cambios de estado
            }
          ),

          // Una forma de separar los iconos es agregar un widget de separacion
          //const SizedBox(width: 20,),

          FloatingActionButton(
            child: const Icon(Icons.exposure_zero_outlined),
            onPressed: () {
              counter = 0;
              // Esta funcion le dice al framework que un estado cambio y tiene que redibujar el widget de nuevo
              setState(() {}); // Recibe una funcion que a veces se usa para ubicar los cambios de estado
            }
          ),

          // Una forma de separar los iconos es agregar un widget de separacion
          //const SizedBox(width: 20,),

          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              counter--;
              // Esta funcion le dice al framework que un estado cambio y tiene que redibujar el widget de nuevo
              setState(() {}); // Recibe una funcion que a veces se usa para ubicar los cambios de estado
            }
          ),
        ],
      ),
    );
  }
}