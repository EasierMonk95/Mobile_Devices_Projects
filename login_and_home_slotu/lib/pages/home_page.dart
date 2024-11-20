import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_and_home_slotu/pages/registerlab_page.dart';
import 'chat_page.dart';
import 'cnc_page.dart';
import 'computer_page.dart';
import 'reservations_page.dart';
import 'soldadura_page.dart';
import 'login_page.dart';
import 'availability_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> reservations = [];
  String? userId;
  String? userRole;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userDoc.exists) {
        setState(() {
          userRole = userDoc['role'];
        });
      }
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
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: const Color(0xFF004B28),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout();
                }
                else if (value == 'availability' && userRole == 'laboratorista') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvailabilityPage()),
                  );
                }
                else if (value == 'registerLab' && userRole == 'laboratorista') {
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
                return [
                  if (userRole == 'laboratorista')
                    PopupMenuItem<String>(
                      value: 'availability',
                      child: ListTile(
                        leading: Icon(Icons.settings, color: Colors.black),
                        title: Text('Configurar Disponibilidad'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'registerLab',
                      child: ListTile(
                        leading: Icon(Icons.person_add, color: Colors.black),
                        title: Text('Registrar laboratorista'),
                      ),
                    ),
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
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                icon: Icon(Icons.computer_rounded, color: Colors.white),
                child: Text(
                  'Comput.',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                icon: Icon(Icons.build_circle_rounded, color: Colors.white),
                child: Text(
                  'CNC',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                icon: Icon(Icons.bookmark, color: Colors.white),
                child: Text(
                  'Reservas',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                icon: Icon(Icons.chat_bubble, color: Colors.white),
                child: Text(
                  'Foro',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        body: userId == null || userRole == null
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
          children: [
            SoldaduraPage(userId: userId!,),
            ComputerPage(userId: userId!,),
            CncPage(userId: userId!,),
            ReservationsPage(
              userId: userId!,
            ),
            ChatPage(),
          ],
        ),
      ),
    );
  }
}
