import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;
  
  const CustomInputField({
    Key? key, 
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.obscureText = false, // para no ponerlo opcional con ? pero que no sea necesario lo envie le pongo un valor default
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField( // Tiene mas interacciones con formulario que el TextField
      // autofocus: true, // Para que inicie seleccionado
      initialValue: '',
      textCapitalization: TextCapitalization.words, // Para ayudar al usuario para que las palabras se capitalicen
      keyboardType: keyboardType, // para cambiar los teclados y ayudar al usuario
      obscureText: obscureText, // para no mostrar el texto (claves)
      onChanged: (value) => formValues[formProperty] = value, // Le asigno el valor ingresado al mapa de datos ingresados
      validator: (value) { // Si se devuelve un string es que la validacion no paso
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Minimo de 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction, // Esto es necesario para que el formulario sepa cuendo hacer la validacion
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
      ),
             );
  }
}