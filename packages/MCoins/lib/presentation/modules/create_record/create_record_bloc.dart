import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_repo/records_repo.dart';
import 'package:rxdart/subjects.dart';

class CreateRecordBloc extends BaseBloc {
  Sink<String> get note => _note.sink;
  Sink<String> get amount => _amount.sink;
  Sink<Category> get category => _category.sink;

  Stream<Category> get selectedCategory => _category.stream;

  final _note = BehaviorSubject<String>();
  final _amount = BehaviorSubject<String>();
  final _category = BehaviorSubject<Category>();

  CreateRecordBloc() {
    _category.add(Category.all.first);
  }

  void create() {}
}
