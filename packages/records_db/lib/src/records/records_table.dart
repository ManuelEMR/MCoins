import 'package:moor/moor.dart';

@DataClassName("Record")
class Records extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get notes => text().nullable().withLength(max: 50)();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get categoryId => integer()();
  BoolColumn get isExpense => boolean().withDefault(const Constant(false))();
}
