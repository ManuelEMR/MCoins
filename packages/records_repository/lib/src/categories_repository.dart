import 'package:records_db/records_db.dart';

class CategoriesRepository {
  final CategoriesDao _dao;

  CategoriesRepository(this._dao);

  Stream<List<Category>> watchCategories() => _dao.watchEntriesInCategories();
}
