import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  final TextEditingController _soldaduraController = TextEditingController();
  final TextEditingController _computerController = TextEditingController();
  final TextEditingController _cncController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAvailableSlots();
  }

  Future<void> _loadAvailableSlots() async {
    // Cargar los datos de cada documento
    final soldaduraDoc = await FirebaseFirestore.instance.collection('settings').doc('soldadura').get();
    final computerDoc = await FirebaseFirestore.instance.collection('settings').doc('computer').get();
    final cncDoc = await FirebaseFirestore.instance.collection('settings').doc('cnc').get();

    // Establecer los valores iniciales en los controladores
    setState(() {
      _soldaduraController.text = soldaduraDoc.data()?['availableSlots']?.toString() ?? '0';
      _computerController.text = computerDoc.data()?['availableSlots']?.toString() ?? '0';
      _cncController.text = cncDoc.data()?['availableSlots']?.toString() ?? '0';
    });
  }

  Future<void> _updateAllAvailableSlots() async {
    try {
      // Actualizar los datos en Firestore
      await FirebaseFirestore.instance.collection('settings').doc('soldadura').update({
        'availableSlots': int.parse(_soldaduraController.text),
      });
      await FirebaseFirestore.instance.collection('settings').doc('computer').update({
        'availableSlots': int.parse(_computerController.text),
      });
      await FirebaseFirestore.instance.collection('settings').doc('cnc').update({
        'availableSlots': int.parse(_cncController.text),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Disponibilidad actualizada con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar la disponibilidad: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modificar Disponibilidad de Equipos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAvailabilityField(
                label: "Cantidad de estaciones de soldadura disponibles",
                controller: _soldaduraController,
              ),
              const SizedBox(height: 20),
              _buildAvailabilityField(
                label: "Cantidad de computadores disponibles",
                controller: _computerController,
              ),
              const SizedBox(height: 20),
              _buildAvailabilityField(
                label: "Cantidad de CNC disponibles",
                controller: _cncController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _updateAllAvailableSlots,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Guardar Cambios",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvailabilityField({required String label, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
        filled: true,
        fillColor: const Color(0x4DFFFFFF), // Fondo semitransparente
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white70),
        ),
      ),
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
