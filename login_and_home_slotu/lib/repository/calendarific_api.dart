import 'dart:convert';

import 'package:login_and_home_slotu/models/api_calendarific_2024_response.dart';
import 'package:login_and_home_slotu/models/api_calendarific_2025_response.dart';
import 'package:http/http.dart' as http;

class CalendarificApi2024 {

  Future<ApiCalendarific2024Response> getHolidays2024() async {
    final response2024 =
      await http.get(Uri.parse('https://calendarific.com/api/v2/holidays?&api_key=9gMbnsL1QGCg1MCz79JIsqxhN2RorEKT&country=CO&year=2024'));
      print('Respuesta: ${response2024.body}');

      if (response2024.statusCode == 200){
        return ApiCalendarific2024Response.fromJson(jsonDecode(response2024.body));
      }
      else {
        throw Exception('Falla al cargar días festivos');
      }
  }
}

class CalendarificApi2025 {

  Future<ApiCalendarific2025Response> getHolidays2025() async {
    final response2025 =
      await http.get(Uri.parse('https://calendarific.com/api/v2/holidays?&api_key=9gMbnsL1QGCg1MCz79JIsqxhN2RorEKT&country=CO&year=2025'));
      print('Respuesta: ${response2025.body}');

      if (response2025.statusCode == 200){
        return ApiCalendarific2025Response.fromJson(jsonDecode(response2025.body));
      }
      else {
        throw Exception('Falla al cargar días festivos');
      }
  }
}