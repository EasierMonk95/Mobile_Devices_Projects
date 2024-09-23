import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final _tarea = TextEditingController();
  List<String> tareas = []; // Lista para almacenar las tareas
  List<bool> _checkboxStates = []; // Lista con los booleanos

  void _adicionartext() {
    if (_tarea.text.isNotEmpty) {
      setState(() {
        tareas.add(_tarea.text);
        _checkboxStates.add(false); // Agregar un estado por defecto para el nuevo checkbox
        _tarea.clear();
      });
    }
  }

  void _eliminarTarea(int index) {
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        tareas.removeAt(index);
        _checkboxStates.removeAt(index); // Eliminar el estado del checkbox correspondiente
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent.shade100,
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              "Lista de tareas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(width: 15), // Espacio entre el texto y el ícono
            Icon(
              Icons.add_task,
              size: 25,// Ícono junto al título
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 25.0, right: 30.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/icons/listacheck.png'),
                  width: 150,
                  height: 150,
                ),
                const Text(
                  "Hola tú, ¿Qué tienes para hoy?",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _tarea,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Descripción de la tarea ",
                  ),
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  icon: const Icon(Icons.add, size:18),
                  onPressed: (){
                    _adicionartext();
                  },
                  label: const Text("Agregar"),
                ),
                const SizedBox(height: 16.0),

                ...tareas.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tarea = entry.value;
                  return Row(
                    children: [
                      Checkbox(
                        value: _checkboxStates[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _checkboxStates[index] = value!;
                            if (value) {
                              _eliminarTarea(index);
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: Container(
                          width: 20.0, // Ancho fijo
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0, ),
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent.shade100,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            tarea,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ), // Color del texto
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}