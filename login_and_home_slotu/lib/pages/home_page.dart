import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Color(0xFF004B28),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.edit_attributes_rounded, color: Colors.white,),
                child: Text(
                  'Soldadura',
                  style: TextStyle(color: Colors.white),  // Color blanco para el texto
                ),
              ),
              Tab(icon: Icon(Icons.computer_rounded, color: Colors.white,),
                child: Text(
                  'Comput.',
                  style: TextStyle(color: Colors.white),  // Color blanco para el texto
                ),

              ),
              Tab(icon: Icon(Icons.build_circle_rounded, color: Colors.white,),
                child: Text(
                  'CNC',
                  style: TextStyle(color: Colors.white),  // Color blanco para el texto
                ),),
              Tab(icon: Icon(Icons.chat_bubble, color: Colors.white,),
                child: Text(
                  'Foro',
                  style: TextStyle(color: Colors.white),  // Color blanco para el texto
                ),),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Soldadura')),
            Center(child: Text('Computadores')),
            Center(child: Text('CNC')),
            Center(child: Text('Foro')),
          ],
        ),
      ),
    );
  }
}
