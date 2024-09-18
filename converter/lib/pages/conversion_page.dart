import 'package:flutter/material.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

const List<String> list = <String>['USD', 'COP', 'EUR', 'GBP'];
// Diccionario de tasas de cambio
Map<String, double> exchangeRates = {
  'COP_USD': 0.00024,
  'EUR_USD': 1.10,
  'GBP_USD': 1.31,
  'USD_COP': 4285.23,
  'EUR_COP': 4683.70,
  'GBP_COP': 5556.88,
  'USD_EUR': 0.91,
  'GBP_EUR': 1.19,
  'COP_EUR': 0.00021,
  'USD_GBP': 0.76,
  'EUR_GBP': 0.84,
  'COP_GBP': 0.00018
};

class _ConversionPageState extends State<ConversionPage> {

  final _controller = TextEditingController();
  final _resultController = TextEditingController();
  ValueNotifier<String> dropdownValue = ValueNotifier<String>(list.first);
  ValueNotifier<String> dropdownValue2 = ValueNotifier<String>(list.first);

  @override
  void initState() {
    super.initState();

    // Escucha los cambios en el primer TextFormField
    _controller.addListener(() {
      _updateResult();
    });

    dropdownValue.addListener((){
      _updateResult();
    });

    dropdownValue2.addListener((){
      _updateResult();
    });
  }

  // Actualiza el resultado en el segundo TextFormField
  void _updateResult() {
    String resulted = '${dropdownValue.value}_${dropdownValue2.value}';

    // Intenta convertir el texto ingresado a un número
    double? input = double.tryParse(_controller.text);
    // Si el número es válido, actualiza el resultado
    if (input != null) {
      _resultController.text = (input * exchangeRates[resulted]!).toString(); // Ejemplo: Doble del valor
    } else {
      _resultController.clear(); // Limpia el campo si el input no es válido
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertidor de monedas"),
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
                  image: AssetImage('assets/icons/Exchange.png'),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 32.0),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Ingrese la cantidad de dinero',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton(
                      value: dropdownValue.value,
                      icon: const Icon(Icons.arrow_circle_down_outlined),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue.value = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: _resultController,
                      readOnly: true, // Campo de solo lectura
                      decoration: const InputDecoration(
                        labelText: 'Resultado',
                        border: OutlineInputBorder(),
                      ),
                    )),
                    const SizedBox(width: 10),
                    DropdownButton(
                        value: dropdownValue2.value,
                        icon: const Icon(Icons.arrow_circle_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue2.value = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                    const SizedBox(width: 10),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
