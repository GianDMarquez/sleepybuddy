import 'package:isar/isar.dart';

part 'entry.g.dart';

@Collection()
class Entry {
  Id entryID = Isar.autoIncrement;
  late DateTime createdDate;
  late String title;
  late String content;
}    
  