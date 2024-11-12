import 'package:flutter/material.dart';

class SoldaduraPage extends StatelessWidget {
  final List<String> days = ["Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"];
  final List<String> hours = [
    "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendario de Soldadura")),
      body: Column(
        children: [
          Row(
            children: days.map((day) => Expanded(child: Text(day, textAlign: TextAlign.center))).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(child: Text(hours[index], textAlign: TextAlign.center)),
                    for (int i = 0; i < 7; i++)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Abre un diálogo para añadir eventos
                          },
                          child: Container(
                            height: 60,
                            margin: EdgeInsets.all(2),
                            color: Colors.grey[300],
                            child: Center(child: Text(" ")),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

