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
            SoldaduraPage(),
            ComputerPage(),
            CncPage(),
            ReservationsPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
