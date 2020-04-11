import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:categories_repo/categories_repo.dart';

class CategoriesBloc extends BaseBloc {
  Stream<List<Category>> get categories => _categories.stream;

  final _categories = BehaviorSubject<List<Category>>();
}
