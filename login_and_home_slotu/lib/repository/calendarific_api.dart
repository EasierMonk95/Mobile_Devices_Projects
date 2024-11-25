import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_performance/firebase_performance.dart';

class CalendarificApi2024 {
  Future<List<DateTime>> getHolidayDates2024() async {
    final FirebasePerformance performance = FirebasePerformance.instance;

    // Configurar métricas para la solicitud HTTP
    final HttpMetric metric = performance.newHttpMetric(
      'https://calendarific.com/api/v2/holidays',
      HttpMethod.Get,
    );

    try {
      await metric.start();

      final Uri url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?&api_key=mxVYS4nKTqS5TYJd8miRcNZBCUqkQy1a&country=CO&year=2024',
      );
      final response = await http.get(url);

      // Registrar el código de estado y el tamaño de la respuesta
      metric.httpResponseCode = response.statusCode;
      metric.responsePayloadSize = response.contentLength;

      if (response.statusCode == 200) {
        // Agregar métrica de éxito
        metric.putAttribute('success', 'true');

        final data = jsonDecode(response.body);
        List<dynamic> holidays = data["response"]["holidays"];

        List<DateTime> holidayDates = holidays.map((holiday) {
          String isoDate = holiday["date"]["iso"];
          DateTime date = DateTime.parse(isoDate);
          print('Fecha de día festivo: $date');
          return date;
        }).toList();

        return holidayDates;
      } else {
        // Agregar métrica de fallo
        metric.putAttribute('success', 'false');

        print('Error en la solicitud a la API: Código de estado ${response.statusCode}');
        throw Exception('Falla al cargar días festivos');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    } finally {
      await metric.stop();
    }
  }
}

class CalendarificApi2025 {
  Future<List<DateTime>> getHolidayDates2025() async {
    final FirebasePerformance performance = FirebasePerformance.instance;

    // Configurar métricas para la solicitud HTTP
    final HttpMetric metric = performance.newHttpMetric(
      'https://calendarific.com/api/v2/holidays',
      HttpMethod.Get,
    );

    try {
      await metric.start();

      final Uri url = Uri.parse(
        'https://calendarific.com/api/v2/holidays?&api_key=mxVYS4nKTqS5TYJd8miRcNZBCUqkQy1a&country=CO&year=2025',
      );
      final response = await http.get(url);

      // Registrar el código de estado y el tamaño de la respuesta
      metric.httpResponseCode = response.statusCode;
      metric.responsePayloadSize = response.contentLength;

      if (response.statusCode == 200) {
        // Agregar métrica de éxito
        metric.putAttribute('success', 'true');

        final data = jsonDecode(response.body);
        List<dynamic> holidays = data["response"]["holidays"];

        List<DateTime> holidayDates = holidays.map((holiday) {
          String isoDate = holiday["date"]["iso"];
          DateTime date = DateTime.parse(isoDate);
          print('Fecha de día festivo: $date');
          return date;
        }).toList();

        return holidayDates;
      } else {
        // Agregar métrica de fallo
        metric.putAttribute('success', 'false');

        print('Error en la solicitud a la API: Código de estado ${response.statusCode}');
        throw Exception('Falla al cargar días festivos');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    } finally {
      await metric.stop();
    }
  }
}
