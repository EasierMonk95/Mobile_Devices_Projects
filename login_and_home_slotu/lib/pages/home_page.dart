import 'package:flutter/material.dart';
import 'package:login_and_home_slotu/pages/chat_page.dart';
import 'package:login_and_home_slotu/pages/cnc_page.dart';
import 'package:login_and_home_slotu/pages/computer_page.dart';
import 'package:login_and_home_slotu/pages/profile_page.dart';
import 'package:login_and_home_slotu/pages/reservations_page.dart';
import 'package:login_and_home_slotu/pages/soldadura_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_and_home_slotu/pages/registerlab_page.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> reservations = [];
  String currentUserRole = 'normal'; // Rol por defecto.

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  void _fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        currentUserRole = userData['role'] ?? 'normal'; // Rol por defecto.
      });
    }
  }

  void _cancelReservation(Map<String, dynamic> reservation) {
    setState(() {
      reservations.remove(reservation);
    });
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF004B28),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout();
                } else if (value == 'registerLab') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterUserPage(),
                    ),
                  ).then((_) {
                    setState(() {});
                  });
                }
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<String>> menuItems = [
                  PopupMenuItem<String>(
                    value: 'logout',
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.black),
                      title: Text('Cerrar sesión'),
                    ),
                  ),
                ];

                if (currentUserRole == 'laboratorista') {
                  menuItems.add(
                    PopupMenuItem<String>(
                      value: 'registerLab',
                      child: ListTile(
                        leading: Icon(Icons.person_add, color: Colors.black),
                        title: Text('Registrar laboratorista'),
                      ),
                    ),
                  );
                }

                return menuItems;
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
                    fontSize: 10,
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.computer_rounded, color: Colors.white),
                child: Text(
                  'Comput.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.build_circle_rounded, color: Colors.white),
                child: Text(
                  'CNC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: Colors.white),
                child: Text(
                  'Reservas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
              Tab(
                icon: Icon(Icons.chat_bubble, color: Colors.white),
                child: Text(
                  'Foro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SoldaduraPage(reservations: reservations),
            ComputerPage(reservations: reservations),
            CncPage(reservations: reservations),
            ReservationsPage(
              reservations: reservations,
              onCancelReservation: _cancelReservation,
            ),
            ChatPage(),
          ],
        ),
      ),
    );
  }
}
