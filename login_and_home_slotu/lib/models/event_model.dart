import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String hour;


  Event({
    required this.date,
    required this.hour,
  });
}
