import 'dart:math';

import 'package:flutter/material.dart';

class ResistorPage extends StatefulWidget {
  @override
  _ResistorPageState createState() => _ResistorPageState();
}

class _ResistorPageState extends State<ResistorPage> {

  // Controladores para almacenar valores de resistencia y colores
  List<int?> _resistorMultiplier = [];

  // Lista de valores y colores para los códigos de resistencia
  final List<Map<String, dynamic>> _resistanceColors = [
    {'color': Colors.black, 'value': 0},
    {'color': Colors.brown, 'value': 1},
    {'color': Colors.red, 'value': 2},
    {'color': Colors.orange, 'value': 3},
    {'color': Colors.yellow, 'value': 4},
    {'color': Colors.green, 'value': 5},
    {'color': Colors.blue, 'value': 6},
    {'color': Colors.purple, 'value': 7},
    {'color': Colors.grey, 'value': 8},
    {'color': Colors.white, 'value': 9},
  ];

  int counter = 0;

  @override
  void initState() {
    super.initState();
    _addResistorField(); // Agregar el los cuatro campos de forma predeterminada
    _addResistorField();
    _addResistorField();
  }

  // Función para agregar un nuevo campo de nota
  void _addResistorField() {
    if(counter < 5){
      _resistorMultiplier.add(0); // Multiplicador predeterminado (0)
      counter++;
    }
    else{
      _showErrorDialog();
    }

    setState(() {});
  }

  // Función para agregar un nuevo campo de nota
  void _removeResistorField() {
    if(counter > 3){
      _resistorMultiplier.removeLast(); // Multiplicador predeterminado (0)
      counter--;
    }
    else{
      _showErrorDialog();
    }

    setState(() {});
  }

  // Mostrar el resultado en un diálogo.
  void _showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Resultado Final'),
          content: Text('La resistencia es: $result'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Solo hay resistencias de 3 a 5 bandas.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Función para calcular la resistencia
  void _calculateResistor() {
    // Verifica que al menos haya 3 bandas
    if (_resistorMultiplier.length < 3) {
      _showErrorDialog();
      return;
    }

    // Toma los primeros 2 o 3 dígitos
    String digits = '';
    for (int i = 0; i < _resistorMultiplier.length - 1; i++) {
      digits += _resistorMultiplier[i].toString();
    }

    // El último dígito representa el número de ceros
    int zeros = _resistorMultiplier.last!;

    // Calcula el valor de la resistencia
    int resistanceValue = int.parse(digits) * (pow(10, zeros) as int);

    // Convertir el valor a unidades (Ohmios, kiloOhmios, megaOhmios)
    String result = _convertToReadableUnit(resistanceValue);

    // Mostrar el resultado
    _showResultDialog(result);
  }

  // Función para convertir la resistencia en unidades legibles
  String _convertToReadableUnit(int value) {
    if (value >= 1000000) {
      return (value / 1000000).toStringAsFixed(2) + ' MΩ';
    } else if (value >= 1000) {
      return (value / 1000).toStringAsFixed(2) + ' kΩ';
    } else {
      return value.toString() + ' Ω';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Resistencias'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/icons/resistor.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Expanded(
              child:
                ListView.builder(
                  itemCount: _resistorMultiplier.length,
                  itemBuilder: (context, index){
                    return Column(
                      children : [
                        DropdownButton<int>(
                          value: _resistorMultiplier[index],
                          items: _resistanceColors.map((resistor){
                            return DropdownMenuItem<int>(
                              value: resistor['value'],
                              child: Row(
                                children: [
                                  // Barra de color
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: resistor['color'],
                                  ),
                                  SizedBox(width: 20), // Espacio entre el color y el texto
                                  // Texto que muestra el valor de la resistencia
                                  Text(
                                    resistor['value'].toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _resistorMultiplier[index] = newValue!;
                            });
                          },
                        ),
                      ]
                    );
                  }
                ),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: _addResistorField,
              child: Text('Agregar banda'),
            ),
            SizedBox(height: 5,),
            ElevatedButton(
              onPressed: _removeResistorField,
              child: Text('Remover banda'),
            ),
            SizedBox(height: 5,),
            ElevatedButton(
                onPressed: _calculateResistor,
                child: Text("Calcular resistencia")
            ),
          ],
        ),

      ),
    );
  }
}

