import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
      
          Slider.adaptive( // El adptative adapta el widget a que se vea estilo IOS o android. Algunos widgets lo tienen
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue,
            onChanged: _sliderEnabled
              ? (value) {
                _sliderValue = value;
                setState(() {});
              }
              : null
          ),

          Checkbox(
            value: _sliderEnabled,
            onChanged: (value) { // Si sliderEnabled esta habilitado ejecuto esta funcion
              _sliderEnabled = value ?? true; // si es null lo hace true
              setState(() {});
            }
          ),

          CheckboxListTile(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) => setState(() {_sliderEnabled = value ?? true;})
          ),

          Switch(
            value: _sliderEnabled,
            onChanged: (value) => setState(() {_sliderEnabled = value;})
          ),

          SwitchListTile.adaptive( // Para que se adapte a IOS y a android
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) => setState(() {_sliderEnabled = value;})
          ),

          Expanded( // Para que el widget ocupe lo maximo posible
            child: SingleChildScrollView( // Para que si la imagen es mas alta pueda hacer scroll
              child: Image(
                image: const NetworkImage('http://assets.stickpng.com/images/580b57fbd9996e24bc43c01d.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(height: 50,)
          
        ],
      ),
    );
  }
}