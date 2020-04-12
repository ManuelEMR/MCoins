import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/subjects.dart';

class CreateRecordBloc extends BaseBloc {
  Sink<String> get note => _note.sink;
  Sink<String> get amount => _amount.sink;
  Sink<Category> get category => _category.sink;

  Stream<Category> get selectedCategory => _category.stream;
  Stream<List<Category>> get categories => _categories.stream;

  final _note = BehaviorSubject<String>();
  final _amount = BehaviorSubject<String>();
  final _category = BehaviorSubject<Category>();
  final _date = BehaviorSubject<DateTime>();
  final _categories = BehaviorSubject<List<Category>>();

  final RecordsDatabase _database;

  CreateRecordBloc(this._database) {
    _database.categoriesDao
        .watchEntriesInCategories()
        .listen(_categories.add)
        .addTo(subscriptions);
  }

  void addDate(DateTime date) {
    _date.add(date);
  }

  void create() {}
}
