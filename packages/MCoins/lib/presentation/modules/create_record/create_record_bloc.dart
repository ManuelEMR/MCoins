import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:records_db/records_db.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

part 'create_record_bloc.freezed.dart';

@freezed
abstract class _Mode with _$_Mode {
  const factory _Mode.create() = Create;
  const factory _Mode.edit([RecordWithCategory recordWithCategory]) = Edit;
}

class UpsertRecordBloc extends BaseBloc {
  Sink<Category> get category => _category.sink;

  Stream<Category> get selectedCategory => _category.stream;
  Stream<List<Category>> get categories => _categories.stream;
  Stream<String> get amount => _amount.stream.distinct();
  Stream<String> get note => _note.stream.distinct();
  Stream<String> get date => _date.map((dateTime) => dateTime.mediumFormat);
  Stream<bool> get isCreateButtonEnabled => CombineLatestStream.combine3(
          _date,
          _category,
          _amount,
          (DateTime date, Category category, String amount) =>
              date != null && category != null && amount.isNotEmpty)
      .startWith(false);
  String get title => _mode.value.when(
        create: () => 'New Transaction',
        edit: (_) => 'Edit Transaction',
      );
  Stream<String> get buttonText => _mode.map(
        (mode) => mode.when(
          create: () => 'Create',
          edit: (_) => 'Update',
        ),
      );

  final _note = BehaviorSubject<String>();
  final _amount = BehaviorSubject<String>();
  final _category = BehaviorSubject<Category>();
  final _date = BehaviorSubject<DateTime>.seeded(DateTime.now());
  final _categories = BehaviorSubject<List<Category>>();
  final _mode = BehaviorSubject<_Mode>.seeded(const _Mode.create());

  final RecordsRepository _recordsRepository;
  final CategoriesRepository _categoriesRepository;

  UpsertRecordBloc(this._categoriesRepository, this._recordsRepository) {
    _categoriesRepository
        .watchCategories()
        .listen(_categories.add)
        .addTo(subscriptions);
  }

  void prefill(RecordWithCategory recordWithCategory) {
    if (recordWithCategory == null) return;
    final record = recordWithCategory.record;
    final category = recordWithCategory.category;

    if (record != null) {
      addDate(record.createdAt);

      _amount.add(record.amount.toString());
      _note.add(record.notes);
      _mode.add(_Mode.edit(recordWithCategory));
    }

    if (category != null ){
      setCategory(category);
    }
  }

  void addDate(DateTime date) {
    _date.add(date);
  }

  void setCategory(Category category) {
    _category.add(category);
  }

  void addNote(String note) {
    _note.add(note);
  }

  void addAmount(String amount) {
    _amount.add(amount);
  }

  Future<bool> upsert() {
    return _mode.value.when(
        create: () => insert(),
        edit: (recordWithCategory) => update(recordWithCategory));
  }

  Future<bool> insert() {
    final amount = double.tryParse(_amount.value);
    final notes = _note.value;
    final createdAt = _date.value;
    final category = _category.value.id;
    return _recordsRepository
        .createRecord(amount, notes, createdAt, category)
        .then((success) => true);
  }

  Future<bool> update(RecordWithCategory recordWithCategory) {
    final amount = double.tryParse(_amount.value);
    final notes = _note.value;
    final createdAt = _date.value;
    final category = _category.value.id;

    return _recordsRepository.updateRecord(
      recordWithCategory.record
          .copyWith(amount: amount, notes: notes, createdAt: createdAt),
      category,
    );
  }
}
