import 'dart:async';

import 'package:moor/moor.dart';
import 'package:records_db/src/database.dart';
import 'package:records_db/src/records/models/record_with_category.dart';
import 'package:records_db/src/records/records_dao.dart';

class RecordsRepository {
  final RecordsDao _dao;
  Stream<List<RecordWithCategory>> get records => _records.stream;

  final _records = StreamController<List<RecordWithCategory>>.broadcast();

  RecordsRepository(this._dao) {
    _dao.watchRecordsWithCategories().listen(_records.add);
  }

  Future<int> createRecord(
      double amount, String notes, DateTime createdAt, int category) {
    final newRecord = RecordsCompanion.insert(
        amount: amount,
        notes: Value(notes),
        createdAt: createdAt,
        categoryId: category);
    return _dao.addRecord(newRecord);
  }

  Future<bool> updateRecord(Record record, int categoryId) {
    final companion =
        record.copyWith(categoryId: categoryId).createCompanion(false);
    return _dao.updateRecord(companion);
  }

  Future<List<Record>> getRecordsForCategory(int categoryId) {
    return _dao.getRecordsForCategory(categoryId);
  }
}
