import 'package:moor/moor.dart';
import 'package:records_repo/src/database.dart';

import 'category_table.dart';

part 'categories_dao.g.dart';

@UseDao(tables: [Categories])
class CategoriesDao extends DatabaseAccessor<RecordsDatabase>
    with _$CategoriesDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoriesDao(RecordsDatabase db) : super(db);

  Stream<List<Category>> watchEntriesInCategories() {
    return select(categories).watch();
  }
}
