import 'package:moor/moor.dart';
import 'package:records_db/src/database.dart';
import 'package:records_db/src/records/models/record_with_category.dart';

import 'records_table.dart';

part 'records_dao.g.dart';

@UseDao(tables: [Records])
class RecordsDao extends DatabaseAccessor<RecordsDatabase>
    with _$RecordsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  RecordsDao(RecordsDatabase db) : super(db);

  Future<int> addRecord(RecordsCompanion entry) {
    return db.into(db.records).insert(entry);
  }

  Future<bool> updateRecord(RecordsCompanion entry) {
    return db.update(db.records).replace(entry);
  }

  Stream<List<Record>> watchRecords() => select(records).watch();

  Stream<List<RecordWithCategory>> watchRecordsWithCategories() {
    return select(records)
        .join([
          leftOuterJoin(
              db.categories, db.categories.id.equalsExp(records.categoryId)),
        ])
        .watch()
        .map(_mapToRecordWithCategory);
  }

  Stream<List<Record>> watchRecordsForCategory(int categoryId) {
    return (select(records)..where((tbl) => tbl.categoryId.equals(categoryId)))
        .watch();
  }

  Stream<List<RecordWithCategory>> watchRecordsWithCategoriesIn(
      int month, int year) {
    return (select(records)
          ..where((tbl) =>
              tbl.createdAt.month.equals(month) &
              tbl.createdAt.year.equals(year)))
        .join([
          leftOuterJoin(
              db.categories, db.categories.id.equalsExp(records.categoryId)),
        ])
        .watch()
        .map(_mapToRecordWithCategory);
  }

  List<RecordWithCategory> _mapToRecordWithCategory(List<TypedResult> rows) {
    return rows
        .map((row) => RecordWithCategory(
            row.readTable(records), row.readTable(db.categories)))
        .toList();
  }
}
