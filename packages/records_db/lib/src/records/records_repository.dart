import 'dart:async';

import 'package:moor/moor.dart';
import 'package:records_db/src/database.dart';
import 'package:records_db/src/records/models/record_with_category.dart';
import 'package:records_db/src/records/records_dao.dart';
import 'package:rxdart/subjects.dart';

class RecordsRepository {
  final RecordsDao _dao;
  Stream<List<RecordWithCategory>> get records => _records.stream;

  final _records = BehaviorSubject<List<RecordWithCategory>>.seeded([]);

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

  Stream<List<Record>> watchRecordsForCategory(int categoryId) {
    return _dao.watchRecordsForCategory(categoryId);
  }

  Stream<List<RecordWithCategory>> watchRecordsIn(int month, int year) {
    return _dao.watchRecordsWithCategoriesIn(month, year);
  }
}
