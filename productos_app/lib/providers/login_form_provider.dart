import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // Voy a hacer referencia a mi formulario a travez de su key
  // Para ello utilizo el GlobalKey del FormState (mi formulario tiene que mantener el estado)
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  // propiedad privada para saber cuando este procesando el formulario
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    // notifico a los listeners cuando el isloading se modifique
    notifyListeners();
  }

  bool isValidForm() {
    // Con la siguiente linea ejecuto el validate del formulario para validar todos los campos
    // cuando yo lo requiera.
    return formKey.currentState?.validate() ?? false;
  }
}
