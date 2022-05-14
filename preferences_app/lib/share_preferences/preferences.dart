import 'package:shared_preferences/shared_preferences.dart';

// En esta clase todo va a ser estatico para que funcione como un singleton
class Preferences {
  // necesito mantener la instancia de las preferencias para usarla en todo lugar
  // voy a guardar las preferencias estaticamente para que sea la misma en toda mi aplicacion.
  // Con late le digo que se va inicializar mas adelante ya que necesito que pase por cierta inicializacion de flutter.
  // Con late le digo que cuando la vaya a utiizar ya va a estar inicializada.
  static late SharedPreferences
      _prefs; // con el _ la hago privada para inicializarla

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool isDarkmode) {
    _isDarkmode = isDarkmode;
    _prefs.setBool('isDarkmode', isDarkmode);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
}
