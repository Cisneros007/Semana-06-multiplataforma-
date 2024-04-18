import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200], // Fondo gris claro para la aplicación
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Color de fondo de los botones elevados
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Color del texto de los botones elevados
            elevation: MaterialStateProperty.all<double>(5), // Elevación de los botones elevados
            minimumSize: MaterialStateProperty.all<Size>(const Size(80, 80)), // Tamaño mínimo de los botones elevados
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)), // Relleno de los botones elevados
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 30)), // Tamaño del texto de los botones elevados
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // Bordes redondeados de los botones elevados
              ),
            ),
          ),
        ),
      ),
      home: const MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String _output = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
      } else if (buttonText == '=') {
    
      } else {
        _output += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true, 
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('C'),
                    _buildButton('0'),
                    _buildButton('='),
                    _buildButton('+'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _onButtonPressed(buttonText);
          },
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
