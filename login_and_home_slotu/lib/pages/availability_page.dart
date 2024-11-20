import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  int availableSlots = 3;

  @override
  void initState() {
    super.initState();
    _loadAvailableSlots();
  }

  void _loadAvailableSlots() async {
    final doc = await FirebaseFirestore.instance.collection('settings').doc('soldadura').get();
    if (doc.exists) {
      setState(() {
        availableSlots = doc.data()?['availableSlots'] ?? 0;
      });
    }
  }

  void _updateAvailableSlots(int newSlots) async {
    await FirebaseFirestore.instance.collection('settings').doc('soldadura').update({
      'availableSlots': newSlots,
    });
    setState(() {
      availableSlots = newSlots;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modificar Disponibilidad de Equipos")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Slots disponibles actuales: $availableSlots"),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Número de Slots disponibles",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                int? newSlots = int.tryParse(value);
                if (newSlots != null) {
                  _updateAvailableSlots(newSlots);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
