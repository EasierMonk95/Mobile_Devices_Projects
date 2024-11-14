import 'package:flutter/material.dart';

class ReservationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reservations;
  final Function(Map<String, dynamic>) onCancelReservation;

  ReservationsPage({Key? key, required this.reservations, required this.onCancelReservation}) : super(key: key);

  void _showCancelDialog(BuildContext context, Map<String, dynamic> reservation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Deseas cancelar esta reserva?"),
          content: Text("Fecha: ${reservation['date']} \nHora: ${reservation['hour']}"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Sí"),
              onPressed: () {
                onCancelReservation(reservation);
                Navigator.of(context).pop();
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
      appBar: AppBar(title: Text("Reservas")),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ListTile(
            title: Text("Fecha: ${reservation['date']} - Hora: ${reservation['hour']}"),
            onTap: () => _showCancelDialog(context, reservation),
          );
        },
      ),
    );
  }
}
