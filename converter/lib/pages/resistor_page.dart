import 'package:flutter/material.dart';

class ResistorPage extends StatefulWidget {
  @override
  _ResistorPageState createState() => _ResistorPageState();
}

class _ResistorPageState extends State<ResistorPage> {
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

  // Valor seleccionado para la resistencia
  int? _selectedValue;

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
            DropdownButton<int>(
              // Valor seleccionado
              value: _selectedValue,
              // Estilo del DropdownButton
              iconSize: 40, // Tamaño del ícono desplegable
              dropdownColor: Colors.white, // Fondo del Dropdown
              isExpanded: true, // Expande para ocupar más espacio horizontal
              hint: Text("Selecciona un valor de resistencia"),
              items: _resistanceColors.map((resistor) {
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
              // Actualiza el valor seleccionado
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
            ),
            DropdownButton<int>(
              // Valor seleccionado
              value: _selectedValue,
              // Estilo del DropdownButton
              iconSize: 40, // Tamaño del ícono desplegable
              dropdownColor: Colors.white, // Fondo del Dropdown
              isExpanded: true, // Expande para ocupar más espacio horizontal
              hint: Text("Selecciona un valor de resistencia"),
              items: _resistanceColors.map((resistor) {
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
              // Actualiza el valor seleccionado
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
            ),
          ],
        ),

      ),
    );
  }
}

