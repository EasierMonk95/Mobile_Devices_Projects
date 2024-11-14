import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/cnc_page.dart';
import 'package:login_and_home_slotu/pages/computer_page.dart';
import 'package:login_and_home_slotu/pages/profile_page.dart';
import 'package:login_and_home_slotu/pages/reservations_page.dart';
import 'package:login_and_home_slotu/pages/soldadura_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista para almacenar las reservas compartidas entre las páginas
  List<Map<String, dynamic>> reservations = [];

  // Función para cancelar una reserva desde ReservationsPage
  void _cancelReservation(Map<String, dynamic> reservation) {
    setState(() {
      reservations.remove(reservation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Color(0xFF004B28),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.biotech, color: Colors.white),
                child: Text(
                  'Soldadura',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Tamaño de fuente más pequeño
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.computer_rounded, color: Colors.white),
                child: Text(
                  'Comput.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Tamaño de fuente más pequeño
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.build_circle_rounded, color: Colors.white),
                child: Text(
                  'CNC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Tamaño de fuente más pequeño
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: Colors.white),
                child: Text(
                  'Reservas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Tamaño de fuente más pequeño
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.chat_bubble, color: Colors.white),
                child: Text(
                  'Foro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Tamaño de fuente más pequeño
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Pasar la lista de reservas a SoldaduraPage
            SoldaduraPage(reservations: reservations),
            ComputerPage(),
            CncPage(),
            // Pasar la lista de reservas y función de cancelación a ReservationsPage
            ReservationsPage(
              reservations: reservations,
              onCancelReservation: _cancelReservation,
            ),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
