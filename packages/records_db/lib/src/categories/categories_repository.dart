import 'package:records_db/src/categories/categories_dao.dart';
import 'package:records_db/src/database.dart';

class CategoriesRepository {
  final CategoriesDao _dao;

  CategoriesRepository(this._dao);

  Stream<List<Category>> watchCategories() => _dao.watchEntriesInCategories();
}
