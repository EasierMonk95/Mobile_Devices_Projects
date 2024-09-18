import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  // Lista para almacenar los widgets de notas y porcentajes
  List<Widget> _notes = [];

  // Controladores para almacenar notas y porcentajes
  List<TextEditingController> _controllers = [];
  List<double> _percentages = [];

  // Inicializa un conjunto inicial de campos
  @override
  void initState() {
    super.initState();
    _addGradeField();
  }

  // Función para agregar un nuevo campo de nota
  void _addGradeField() {
    TextEditingController controller = TextEditingController();
    _controllers.add(controller);
    _percentages.add(0.1); // Porcentaje predeterminado (10%)

    setState(() {
      _gradeFields.add(
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Nota',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            DropdownButton<double>(
              value: _percentages.last,
              items: [0.05, 0.10, 0.15, 0.20, 0.25, 0.30].map((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text('${(value * 100).toStringAsFixed(0)}%'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  int index = _controllers.indexOf(controller);
                  _percentages[index] = newValue!;
                });
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de notas"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/graduado.png'),
                  width: 120,
                  height: 120,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _controllers[0],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Digite su nombre",
                      prefixIcon: Icon(Icons.person)),
                  keyboardType: TextInputType.name,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
