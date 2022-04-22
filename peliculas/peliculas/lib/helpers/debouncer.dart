import 'dart:async';
// Creditos
// https://stackoverflow.com/a/52922130/7834829

/// Debouncer (Antirrebote). Lo utilizo como widget para esperar a que la persona termine de escribir
/// en el campo de busqueda como para recien ahi enviar la consulta http de busqueda y no siempre
/// que se actualiza el campo.
class Debouncer<T> { // esta de manera generica para que pueda emitir cualquier cosa segun como lo instancie

  Debouncer({ 
    required this.duration, // Cantidad de tiempo que quiero esperar antes de emitir un valor
    this.onValue // Metodo que se va a disparar cuando ya tenga un valor.
  });

  final Duration duration;

  void Function(T value)? onValue;

  // Variables internas
  T? _value; // Valor a devolver
  Timer? _timer; // funcion de control que viene con dart
  
  T get value => _value!;

  set value(T val) { // cuando recibo un valor
    _value = val; // lo asigno a mi variable interna
    _timer?.cancel(); // Cancelo el timer seteado anteriormente
    _timer = Timer(duration, () => onValue!(_value!)); // asigno un nuevo timer que si cumple la duracion especificada llamo a la funcion onValue
  }  
}