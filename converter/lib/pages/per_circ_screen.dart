import 'dart:math';
import 'package:flutter/material.dart';


class PerCircScreen extends StatefulWidget {
  @override
  _PerCircScreenState createState() => _PerCircScreenState();
}

class _PerCircScreenState extends State<PerCircScreen> {
  final TextEditingController _controller = TextEditingController();
  double _resultado = 0.0;

  void _calcularPerimetro() {
    double radio = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _resultado = 2 * pi * radio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Perímetro de un Círculo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa el radio del círculo en cm',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPerimetro,
              child: Text('Calcular Perímetro'),
            ),
            SizedBox(height: 20),
            Text(
              'El perímetro es: $_resultado',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
