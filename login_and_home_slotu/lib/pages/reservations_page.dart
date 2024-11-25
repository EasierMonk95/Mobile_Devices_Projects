import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReservationsPage extends StatelessWidget {
  final String userId;

  ReservationsPage({Key? key, required this.userId}) : super(key: key);

  void _showCancelDialog(BuildContext context, String reservationId, String type, DateTime date, String hour) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Deseas cancelar esta reserva?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Sí"),
              onPressed: () async {
                Navigator.of(context).pop();

                final doc = await FirebaseFirestore.instance.collection(type).doc(DateFormat('yyyy-MM-dd').format(date)).get();
                final slots = doc.data()?['slots'] ?? [];
                final slot = slots.firstWhere((s) => s['hour'] == hour, orElse: () => null);

                if (slot != null) {
                  slot['availableSlots']++;
                  slots[slots.indexWhere((s) => s['hour'] == hour)] = slot;

                  await FirebaseFirestore.instance.collection(type).doc(DateFormat('yyyy-MM-dd').format(date)).update({
                    'slots': slots,
                  });
                }

                await FirebaseFirestore.instance.collection('reservations').doc(reservationId).delete();
              },
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
        title: Text("Mis Reservas", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),),
        toolbarHeight: 68.0,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('reservations')
            .where('user', isEqualTo: userId)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              DateTime date = (doc['date'] as Timestamp).toDate();
              String type = doc['type'];
              String typeDescription = _getTypeDescription(type);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0), // Add spacing between list tiles
                child: Container(
                  decoration: BoxDecoration(
                    color: _getColorByType(type), // Set background color based on type
                    borderRadius: BorderRadius.circular(24.0), // Add rounded corners
                  ),
                  child: ListTile(
                    title: Text(
                      "$typeDescription - Fecha: ${DateFormat('EEE, dd MMM', 'es').format(date)} - Hora: ${doc['hour']}",
                      style: TextStyle(color: Colors.black), // Ensure title text is readable on all backgrounds
                    ),
                    onTap: () => _showCancelDialog(context, doc.id, type, date, "${doc['hour']}"),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  String _getTypeDescription(String type) {
    switch (type) {
      case 'soldadura':
        return "Reserva de equipo de Soldadura";
      case 'cnc':
        return "Reserva de equipo CNC";
      case 'computer':
        return "Reserva de Computador";
      default:
        return "Reserva Desconocida";
    }
  }
}

Color? _getColorByType(String type) {
  switch (type) {
    case 'soldadura':
      return Colors.green[300]; // Lighter green for Soldadura
    case 'cnc':
      return Colors.green; // Standard green for CNC
    case 'computer':
      return Colors.green[700]; // Darker green for Computer
    default:
      return Colors.grey; // Grey for unknown type
  }
}
