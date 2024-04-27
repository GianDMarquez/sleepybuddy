
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry {
  Entry({
    required this.entryID,
    required this.date,
    required this.title,
    required this.content});

  @HiveField(0)
  int entryID;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String title;

  @HiveField(3)
  String content;

}