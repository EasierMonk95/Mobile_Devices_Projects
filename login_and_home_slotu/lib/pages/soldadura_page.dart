import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:login_and_home_slotu/models/api_calendarific_2024_response.dart';
import 'package:login_and_home_slotu/repository/calendarific_api.dart';

import '../models/event_model.dart';

class SoldaduraPage extends StatefulWidget {
  final List<Map<String, dynamic>> reservations;

  SoldaduraPage({Key? key, required this.reservations}) : super(key: key);

  @override
  _SoldaduraPageState createState() => _SoldaduraPageState();
}

class _SoldaduraPageState extends State<SoldaduraPage> {
  List<DateTime> _weekDays = [];
  List<DateTime> _holidays2024 = [];
  List<DateTime> _holidays2025 = [];
  int _currentWeekOffset = 0;

  final List<String> hours = [
    "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
    "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"
  ];

  Box<Event> reservationBox = Hive.box<Event>('reservations');

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    _loadCurrentWeek();
    _loadHolidays();
  }

  void _loadHolidays() async {
    try {
      _holidays2024 = await CalendarificApi2024().getHolidayDates2024();
      _holidays2025 = await CalendarificApi2025().getHolidayDates2025();
      setState(() {});
    } catch (e) {
      print("Error al cargar días festivos: $e");
    }
  }

  void _loadCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1)).add(Duration(days: 7 * _currentWeekOffset));
    _weekDays = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void _changeWeek(int offset) {
    setState(() {
      _currentWeekOffset += offset;
      _loadCurrentWeek();
    });
  }

  void _onDayTap(DateTime date, String hour) {
    if (_isHoliday(date)) {
      _showHolidayNotification(date);
    } else if (_isReserved(date, hour)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Este horario ya está reservado.")),
      );
    } else {
      _showReservationDialog(context, date, hour);
    }
  }

  bool _isReserved(DateTime date, String hour) {
    return reservationBox.values.any((reservation) =>
      reservation.date.year == date.year &&
      reservation.date.month == date.month &&
      reservation.date.day == date.day &&
      reservation.hour == hour
      );
  }

  void _showReservationDialog(BuildContext context, DateTime date, String hour) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Quieres reservar este equipo?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Fecha: ${DateFormat('EEE, dd MMM', 'es').format(date)}"),
              Text("Hora: $hour"),
            ],
          ),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Sí"),
              onPressed: () {
                setState(() {
                  reservationBox.add(Event(date: date, hour: hour));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showHolidayNotification(DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Día Festivo"),
          content: Text("Hoy es festivo: ${DateFormat('EEE, dd MMM', 'es').format(date)}"),
          actions: [
            TextButton(
              child: Text("Ver todos los festivos"),
              onPressed: () {
                Navigator.of(context).pop();
                _showAllHolidaysDialog(date.year);
              },
            ),
            TextButton(
              child: Text("Cerrar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showAllHolidaysDialog(int year) {
    List<DateTime> holidays = (year == 2024) ? _holidays2024 : _holidays2025;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Festivos en $year"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: holidays.map((holiday) => Text(DateFormat('EEE, dd MMM', 'es').format(holiday))).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cerrar"),
              onPressed: () => Navigator.of(context).pop(),
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
        title: Text("Calendario de Soldadura"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _changeWeek(-1),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => _changeWeek(1),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(""), // Espacio vacío para la columna de horas
              ),
              for (DateTime day in _weekDays)
                Expanded(
                  child: Text(
                    DateFormat('EEE\ndd/MM', 'es').format(day),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hours.length,
              itemBuilder: (context, hourIndex) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        hours[hourIndex],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    for (int dayIndex = 0; dayIndex < 7; dayIndex++)
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _onDayTap(_weekDays[dayIndex], hours[hourIndex]);
                          },
                          child: Container(
                            height: 60,
                            margin: EdgeInsets.all(2),
                            color: _isHoliday(_weekDays[dayIndex]) ? Colors.red
                                : _isReserved(_weekDays[dayIndex], hours[hourIndex]) ? Colors.blue
                                : Colors.grey[300],
                            child: Center(child: Text("")),
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

  // Método auxiliar para verificar si un día es festivo
  bool _isHoliday(DateTime day) {
    return _holidays2024.any((holiday) =>
    holiday.year == day.year &&
        holiday.month == day.month &&
        holiday.day == day.day) ||
        _holidays2025.any((holiday) =>
        holiday.year == day.year &&
            holiday.month == day.month &&
            holiday.day == day.day);
  }
}
