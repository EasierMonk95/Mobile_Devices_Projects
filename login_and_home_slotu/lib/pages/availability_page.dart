import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AvailabilityPage extends StatefulWidget {
  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  final List<String> equipmentTypes = ['cnc', 'soldadura', 'computer'];
  final List<String> hours = [
    "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
    "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"
  ];

  String? selectedEquipment;
  String? selectedHour;
  DateTime? selectedDate;
  int? availableSlots;

  void _updateAvailableSlots() async {
    if (selectedEquipment == null || selectedDate == null || selectedHour == null || availableSlots == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, completa todos los campos")),
      );
      return;
    }

    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    try {
      final docRef = FirebaseFirestore.instance.collection(selectedEquipment!).doc(formattedDate);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        List slots = docSnapshot.data()?['slots'] ?? [];
        int slotIndex = slots.indexWhere((slot) => slot['hour'] == selectedHour);

        if (slotIndex >= 0) {
          slots[slotIndex]['availableSlots'] = availableSlots;
        } else {
          slots.add({'hour': selectedHour, 'availableSlots': availableSlots});
        }

        await docRef.update({'slots': slots});
      } else {
        List<Map<String, dynamic>> newSlots = hours.map((hour) {
          return {
            'hour': hour,
            'availableSlots': hour == selectedHour ? availableSlots : 3, // Predeterminado
          };
        }).toList();

        await docRef.set({'slots': newSlots});
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Disponibilidad actualizada exitosamente")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al actualizar: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Disponibilidad"),
        backgroundColor: Colors.green[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Seleccionar equipo"),
              value: selectedEquipment,
              items: equipmentTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type.toUpperCase()));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEquipment = value;
                });
              },
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(selectedDate == null
                  ? "Seleccionar fecha"
                  : "Fecha seleccionada: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}"),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024, 11, 25),
                  lastDate: DateTime(2025, 12, 31),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Seleccionar hora"),
              value: selectedHour,
              items: hours.map((hour) {
                return DropdownMenuItem(value: hour, child: Text(hour));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedHour = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Slots disponibles",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  availableSlots = int.tryParse(value);
                });
              },
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _updateAvailableSlots,
                child: Text("Actualizar", style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

