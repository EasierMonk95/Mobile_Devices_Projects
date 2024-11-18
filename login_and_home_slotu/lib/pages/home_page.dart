import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/cnc_page.dart';
import 'package:login_and_home_slotu/pages/computer_page.dart';
import 'package:login_and_home_slotu/pages/profile_page.dart';
import 'package:login_and_home_slotu/pages/reservations_page.dart';
import 'package:login_and_home_slotu/pages/soldadura_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';

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

  // Función para cerrar sesión
  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Home',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
          backgroundColor: Color(0xFF004B28),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.black),
                      title: Text('Cerrar sesión'),
                    ),
                  ),
                ];
              },
            ),
          ],

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
            ComputerPage(reservations: reservations),
            CncPage(reservations: reservations),
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
