import 'package:moor/moor.dart';
import 'package:records_db/src/database.dart';
import 'package:records_db/src/records/models/record_with_category.dart';
import 'package:records_db/src/records/records_dao.dart';

class RecordsRepository {
  final RecordsDao _dao;

  RecordsRepository(this._dao);

  Stream<List<RecordWithCategory>> watchAllRecordsWithCategories() =>
      _dao.watchRecordsWithCategories();

  Future<int> createRecord(
      double amount, String notes, DateTime createdAt, int category) {
    final newRecord = RecordsCompanion.insert(
        amount: amount,
        notes: Value(notes),
        createdAt: createdAt,
        categoryId: category);
    return _dao.addRecord(newRecord);
  }
}
