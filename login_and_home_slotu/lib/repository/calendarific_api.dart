import 'dart:convert';
import 'package:http/http.dart' as http;

class CalendarificApi2024 {
  Future<List<DateTime>> getHolidayDates2024() async {
    final response = await http.get(
        Uri.parse('https://calendarific.com/api/v2/holidays?&api_key=xYFapUYWHekI6BAadt0yZ6cxjgSQ7YNM&country=CO&year=2024')
    );

    print('Respuesta completa de la API: ${response.body}'); // Muestra la respuesta de la API

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> holidays = data["response"]["holidays"];

      // Imprime las fechas que se están extrayendo para confirmar su formato
      List<DateTime> holidayDates = holidays.map((holiday) {
        String isoDate = holiday["date"]["iso"];
        DateTime date = DateTime.parse(isoDate);
        print('Fecha de día festivo: $date'); // Imprime cada fecha de festivo
        return date;
      }).toList();

      return holidayDates;
    } else {
      print('Error en la solicitud a la API: Código de estado ${response.statusCode}');
      throw Exception('Falla al cargar días festivos');
    }
  }
}



class CalendarificApi2025 {
  Future<List<DateTime>> getHolidayDates2025() async {
    final response = await http.get(
        Uri.parse('https://calendarific.com/api/v2/holidays?&api_key=xYFapUYWHekI6BAadt0yZ6cxjgSQ7YNM&country=CO&year=2025')
    );

    print('Respuesta completa de la API: ${response.body}'); // Muestra la respuesta de la API

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> holidays = data["response"]["holidays"];

      // Imprime las fechas que se están extrayendo para confirmar su formato
      List<DateTime> holidayDates = holidays.map((holiday) {
        String isoDate = holiday["date"]["iso"];
        DateTime date = DateTime.parse(isoDate);
        print('Fecha de día festivo: $date'); // Imprime cada fecha de festivo
        return date;
      }).toList();

      return holidayDates;
    } else {
      print('Error en la solicitud a la API: Código de estado ${response.statusCode}');
      throw Exception('Falla al cargar días festivos');
    }
  }
}