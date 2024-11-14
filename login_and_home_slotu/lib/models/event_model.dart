import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String hour;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  Event({
    required this.date,
    required this.hour,
    required this.title,
    required this.description,
  });
}
