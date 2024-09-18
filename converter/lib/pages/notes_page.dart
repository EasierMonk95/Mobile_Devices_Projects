import 'package:flutter/material.dart';

class GradeCalculator extends StatefulWidget {
  @override
  _GradeCalculatorState createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  // Controladores para almacenar notas y porcentajes
  List<TextEditingController> _controllers = [];
  List<double> _percentages = [];

  // Inicializa un conjunto inicial de campos
  @override
  void initState() {
    super.initState();
    _addGradeField(); // Agregar el primer campo de forma predeterminada
  }

  // Función para agregar un nuevo campo de nota
  void _addGradeField() {
    TextEditingController controller = TextEditingController();
    _controllers.add(controller);
    _percentages.add(0.1); // Porcentaje predeterminado (10%)

    setState(() {});
  }

  // Función para calcular la nota final
  void _calculateFinalGrade() {
    double finalGrade = 0;
    double totalPercentage = 0;

    for (int i = 0; i < _controllers.length; i++) {
      double? grade = double.tryParse(_controllers[i].text);
      double percentage = _percentages[i];

      if (grade != null) {
        finalGrade += grade * percentage;
        totalPercentage += percentage;
      }
    }

    if (totalPercentage == 1.0) {
      _showResultDialog(finalGrade);
    } else {
      _showErrorDialog();
    }
  }

  // Mostrar el resultado en un diálogo
  void _showResultDialog(double result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Resultado Final'),
          content: Text('La nota final es: ${result.toStringAsFixed(2)}'),
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

  // Mostrar error si los porcentajes no suman 100%
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Los porcentajes no suman 100%. Ajuste los valores.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Notas'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/icons/graduado.png'),
              width: 200,
              height: 200,
            ),
            // Lista de campos de nota y porcentaje
            Expanded(
              child: ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controllers[index],
                          decoration: InputDecoration(
                            labelText: 'Nota',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 20),
                      DropdownButton<double>(
                        value: _percentages[index],
                        items: [0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85, 0.90, 0.95, 1.00]
                            .map((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text('${(value * 100).toStringAsFixed(0)}%'),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _percentages[index] = newValue!;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Botón para agregar una nueva nota
            ElevatedButton(
              onPressed: _addGradeField,
              child: Text('Agregar Nota'),
            ),
            SizedBox(height: 20),
            // Botón para calcular la nota final
            ElevatedButton(
              onPressed: _calculateFinalGrade,
              child: Text('Calcular Nota Final'),
            ),
          ],
        ),
      ),
    );
  }
}


