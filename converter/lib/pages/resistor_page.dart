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

  void _addResistorField() {
    if (counter < 5) {
      _resistorMultiplier.add(0); // Multiplicador predeterminado (0)
      counter++;
    } else {
      _showErrorDialog();
    }
    setState(() {});
  }

  void _removeResistorField() {
    if (counter > 3) {
      _resistorMultiplier.removeLast(); // Multiplicador predeterminado (0)
      counter--;
    } else {
      _showErrorDialog();
    }
    setState(() {});
  }

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

  void _calculateResistor() {
    if (_resistorMultiplier.length < 3) {
      _showErrorDialog();
      return;
    }

    String digits = '';
    for (int i = 0; i < _resistorMultiplier.length - 1; i++) {
      digits += _resistorMultiplier[i].toString();
    }

    int zeros = _resistorMultiplier.last!;
    int resistanceValue = int.parse(digits) * (pow(10, zeros) as int);
    String result = _convertToReadableUnit(resistanceValue);
    _showResultDialog(result);
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/icons/resistor.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _resistorMultiplier.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButton<int>(
                        value: _resistorMultiplier[index],
                        isExpanded: true, // Hacer que el DropdownButton sea más largo
                        items: _resistanceColors.map((resistor) {
                          return DropdownMenuItem<int>(
                            value: resistor['value'],
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: resistor['color'],
                                ),
                                SizedBox(width: 20),
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
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addResistorField,
                  child: Text('Agregar banda'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                ElevatedButton(
                  onPressed: _removeResistorField,
                  child: Text('Remover banda'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateResistor,
              child: Text("Calcular resistencia"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
