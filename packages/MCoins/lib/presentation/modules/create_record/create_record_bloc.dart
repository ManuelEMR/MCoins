import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:intl/intl.dart';
import 'package:records_db/records_db.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CreateRecordBloc extends BaseBloc {
  Sink<String> get note => _note.sink;
  Sink<String> get amount => _amount.sink;
  Sink<Category> get category => _category.sink;

  Stream<Category> get selectedCategory => _category.stream;
  Stream<List<Category>> get categories => _categories.stream;
  Stream<String> get date => _date.map((dateTime) => dateTime.mediumFormat);
  Stream<bool> get isCreateButtonEnabled => CombineLatestStream.combine3(
      _date,
      _category,
      _amount,
      (DateTime date, Category category, String amount) =>
          date != null && category != null && amount.isNotEmpty);

  final _note = BehaviorSubject<String>();
  final _amount = BehaviorSubject<String>();
  final _category = BehaviorSubject<Category>();
  final _date = BehaviorSubject<DateTime>.seeded(DateTime.now());
  final _categories = BehaviorSubject<List<Category>>();

  final RecordsRepository _recordsRepository;
  final CategoriesRepository _categoriesRepository;

  CreateRecordBloc(this._categoriesRepository, this._recordsRepository) {
    _categoriesRepository
        .watchCategories()
        .listen(_categories.add)
        .addTo(subscriptions);
  }

  void addDate(DateTime date) {
    _date.add(date);
  }

  void setCategory(Category category) {
    _category.add(category);
  }

  Future<bool> create() {
    final amount = double.tryParse(_amount.value);
    final notes = _note.value;
    final createdAt = _date.value;
    final category = _category.value.id;
    return _recordsRepository
        .createRecord(amount, notes, createdAt, category)
        .then((success) => true);
  }
}
