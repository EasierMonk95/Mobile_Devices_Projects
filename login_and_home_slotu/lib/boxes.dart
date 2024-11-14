import 'package:hive/hive.dart';
import 'package:login_and_home_slotu/models/event_model.dart';

class Boxes{

  static Box<Event> getLocalBox() => Hive.box<Event>('reservations');

}