
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  // El key es algo que me sirve para identificar este widget dentro del contexto
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30,);

    // El sateless widget no renderiza de nuevo cuando cambia algun estado.
    // Si agrego una variable de estado tengo que usar un statefulwidget
    int counter = 10;

    // el build context es todo mi arbol de widgets. en este punto conoce toda la decendencia hasta este punto
    return Scaffold(
      //backgroundColor: Colors.indigo,
      // El appBar no puede ser constante ya que va a variar durante la ejecucion de la aplicacion
      // Por lo tanto sus padres tampoco
      appBar: AppBar( 
        title: const Text('Home Screen'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter++;
          print('Hola Mundo: $counter');

        }
      ),
    );
  }

}