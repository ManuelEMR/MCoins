import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:records_repo/records_repo.dart';
import 'package:rxdart/subjects.dart';

class CategoriesBloc extends BaseBloc {
  Stream<List<Category>> get categories => _categories.stream;

  final _categories = BehaviorSubject<List<Category>>();
}
