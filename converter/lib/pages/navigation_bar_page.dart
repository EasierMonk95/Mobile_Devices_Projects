import 'package:converter/pages/conversion_page.dart';
import 'package:converter/pages/freedom_page.dart';
import 'package:converter/pages/notes_page.dart';
import 'package:converter/pages/resistor_page.dart';
import 'package:flutter/material.dart';


class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget> [
    GradeCalculator(),
    const FreedomPage(),
    const ConversionPage(),
    ResistorPage()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2), label: "Notes App"),
          BottomNavigationBarItem(
              icon: Icon(Icons.api), label: "App libre"),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: "Money App"),
          BottomNavigationBarItem(
              icon: Icon(Icons.electric_bolt), label: "Resistor App"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
