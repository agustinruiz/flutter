import 'package:flutter/material.dart';
import 'package:productos_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      // Para el listview uso un list view builder ya que es mas eficiente que un listview normal
      // Sirve para cuendo no se cuantos elementos voy a tener en la lista ya que los carga
      // de forma peresoza.
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((BuildContext context, int index) => GestureDetector(
              child: const ProductCard(),
              onTap: () => Navigator.pushNamed(context, 'product'),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
