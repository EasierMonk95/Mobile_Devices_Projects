import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:login_and_home_slotu/repository/calendarific_api.dart';
import 'package:google_fonts/google_fonts.dart';

class ComputerPage extends StatefulWidget {
  final String userId;

  ComputerPage({required this.userId});

  @override
  _ComputerPageState createState() => _ComputerPageState();
}

class _ComputerPageState extends State<ComputerPage> {
  List<DateTime> _weekDays = [];
  List<DateTime> _holidays2024 = [];
  List<DateTime> _holidays2025 = [];
  int _currentWeekOffset = 0;
  int availableSlots = 3;
  bool? canReserve;

  final List<String> hours = [
    "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00",
    "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    _loadCurrentWeek();
    _loadAvailableSlots();
    _loadUserRole();
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

  void _loadAvailableSlots() async {
    final doc = await FirebaseFirestore.instance.collection('settings').doc('computer').get();
    if (doc.exists) {
      setState(() {
        availableSlots = doc.data()?['availableSlots'] ?? 0;
      });
    }
  }

  void _loadUserRole() async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
    if (doc.exists) {
      String role = doc.data()?['role'] ?? 'normal';
      setState(() {
        canReserve = (role == 'normal');
      });
    }
  }

  void _loadCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1)).add(Duration(days: 7 * _currentWeekOffset));
    _weekDays = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void _changeWeek(int direction) {
    DateTime today = DateTime.now();
    DateTime startOfCurrentWeek = today.subtract(Duration(days: today.weekday - 1)); // Lunes de la semana actual
    DateTime newStartOfWeek = _weekDays.first.add(Duration(days: direction * 7));
    if (newStartOfWeek.isBefore(startOfCurrentWeek)) return;
    setState(() {
      _currentWeekOffset += direction;
      _loadCurrentWeek();
    });
  }

  Future<bool> _isReserved(DateTime date, String hour) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('computer_reservations')
        .where('date', isEqualTo: date)
        .where('hour', isEqualTo: hour)
        .where('user', isEqualTo: widget.userId)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  void _onDayTap(DateTime date, String hour) async {
    if (canReserve == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cargando datos del usuario...")));
      return;
    }

    if (!canReserve!) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No tienes permiso para hacer reservas.")));
      return;
    }

    if (await _isReserved(date, hour)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ya tienes una reserva para este horario.")));
      return;
    }

    if (_isHoliday(date)) {
      _showHolidayNotification(date);
    } else if (availableSlots > 0) {
      _showReservationDialog(context, date, hour);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No hay equipos disponibles.")));
    }
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
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("Sí"),
              onPressed: () async {
                setState(() => availableSlots--);
                Navigator.of(context).pop();
                await FirebaseFirestore.instance.collection('soldadura_reservations').add({
                  'date': date,
                  'hour': hour,
                  'user': widget.userId,
                  'type': 'computer', // Agregamos el tipo de reserva
                });
                await FirebaseFirestore.instance.collection('settings').doc('computer').update({
                  'availableSlots': FieldValue.increment(-1),
                });
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

  bool _isHoliday(DateTime date) {
    return _holidays2024.any((holiday) => holiday.year == date.year && holiday.month == date.month && holiday.day == date.day) ||
        _holidays2025.any((holiday) => holiday.year == date.year && holiday.month == date.month && holiday.day == date.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendario de Computadores",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        toolbarHeight: 68.0,
        backgroundColor: Colors.green[400],
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
              Expanded(child: Text("")), // Espacio vacío para las horas
              for (DateTime day in _weekDays)
                Expanded(
                  child: Text(
                    DateFormat('EEE\ndd/MM', 'es').format(day),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
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
                    Expanded(child: Text(hours[hourIndex], textAlign: TextAlign.center)),
                    for (int dayIndex = 0; dayIndex < 7; dayIndex++)
                      Expanded(
                        child: InkWell(
                          onTap: () => _onDayTap(_weekDays[dayIndex], hours[hourIndex]),
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.all(2), // Más espacio entre las celdas
                            decoration: BoxDecoration(
                              color: _isHoliday(_weekDays[dayIndex]) ? Colors.grey : Colors.green[900],
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
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
}
