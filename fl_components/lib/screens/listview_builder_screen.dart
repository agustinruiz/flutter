import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  // Para saber su valor tengo que crear un listener. estar escuchando el scroll
  @override
  void initState() { // Cuando el state se crea por primera y unaca vez
    super.initState();

    scrollController.addListener(() { // agrego una funcion que se ejecuta cuando se mueve el scroll
      // si la posicion actual se acerca a menos de 500 pixeles del final del scroll, agrego 5 imagenes mas
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        // add5();
        fetchData();
      }
    });
  }

  void add5(){
    final lastId = imagesIds.last;
    // con lo siguiente agrego 5 nuevos numeros al images Ids lo que significa 5 nuevas imagenes al listview
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
    // Luego refresco la pantalla
    setState(() {});
  }

  // Creo una funcion asincrona que simulara la carga por internet de las imagenes
  Future fetchData() async{

    if(isLoading) return; // Si esta cargando no hago nada

    isLoading = true; // si no estaba cargando lo pongo en estado de carga
    setState(() {}); // Necesito que se redibujen los widgets que trabajan con el isLoading

    await Future.delayed(const Duration(seconds: 3)); // Espero 3 segundos. (simulando request http)

    add5(); // agrego las 5 imagenes que siguen

    isLoading = false; // ya que cargo las 5 imagenes
    setState(() {}); // Vuelvo a llamar al set state ya que hay muchos widgets que varian segun el valor del isLoading

    // Si no estoy cerca del final del scroll no quiero que se mueva solo
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    
    // Para que cuando este al final y termine de cargar nuevas imagenes mueva el scroll solo para que el usuario se de cuenta de que termino de cargar
    scrollController.animateTo(
      // con el offset especifico a que punto del scroll necesito moverme
      scrollController.position.pixels + 120, // en este caso de la posicion actual me muevo 120 pixeles mas
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2)); // Espero 2 segundos. (simulando request http)
    final lastId = imagesIds.last;
    imagesIds.clear(); // Borro los indices de las imagenes que se mostraban de la lista
    imagesIds.add(lastId + 1); // Agrego una imagen nueva posterior a la ultima
    add5(); // agrego 5 imagenes mas que le siguen

  }

  @override
  Widget build(BuildContext context) {
    // El media query me da informacion del dispositivo en donde corre mi app
    final size = MediaQuery.of(context).size; // Con size se sabe el ancho y alto de la pantalla

    return Scaffold(
      body: MediaQuery.removePadding( // widget para remover los paddings de arriba y de abajo en los telefono IOS.
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack( // Este widget me permite poner un widget uno encima del otro (sus children)
          children: [
            // Para hacer el pull to refresh y cargar nuevas imagenes puedo usar el widget RefreshIndicator
            // Se pone sobre el widget que tiene el scroll
            RefreshIndicator(
              color: AppTheme.primary,
              // se le tiene que pasar una funcion asincrona
              // Cuando se termina la funcion asincrona de refresh, ahi recien va a cancelar el RefreshIndicator
              onRefresh: onRefresh, 
              child: ListView.builder(
                physics: const BouncingScrollPhysics(), // Para hacer el efecto de IOS en android
                // Todos los widgets con controlador tienen un controller
                controller: scrollController, // asocio el scroll controller al list view por lo que puedo saber su valor en todo momento
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesIds[index]}'),
                  );
                },
              ),
            ),

            if(isLoading) // Esta permitido ponerle un condicional a una instriccion de una de estas listas. (no se pueden usar llaves)
              Positioned( // Para posicionar un widget dentro del stack
                bottom: 40,
                // Para centrar el loading tengo que hacer algunos calculos
                left: size.width * 0.5 - 30, // la distancia izquierda seray la mitad del ancho del dispositivo menos la mitad del ancho del widget de loading
                child: const _LoadingIcon(),
              )
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      child: const CircularProgressIndicator(
        color: AppTheme.primary,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}