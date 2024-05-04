
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'journalEntry.g.dart';
//TODO: default values
@HiveType(typeId: 0)
class journalEntry {
  journalEntry({
    required this.entryID,
    required this.createdDate,
    required this.title,
    this.content = " ",
    required this.lastEditedDate});

  @HiveField(0)
  int entryID;

  @HiveField(1)
  DateTime createdDate;

  @HiveField(2)
  String title;

  @HiveField(3)
  String content;

  @HiveField(4)
  DateTime lastEditedDate;

}