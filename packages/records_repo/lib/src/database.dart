import 'package:moor/moor.dart';
import 'package:records_repo/src/categories/categories_dao.dart';
import 'package:records_repo/src/categories/category_table.dart';
import 'package:records_repo/src/records/records_dao.dart';
import 'package:records_repo/src/records/records_table.dart';

part 'database.g.dart';

@UseMoor(tables: [Categories, Records], daos: [CategoriesDao, RecordsDao])
class RecordsDatabase extends _$RecordsDatabase {
  RecordsDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      if (details.wasCreated) {
        // add default categories
        await batch((b) => b.insertAll(categories, [
              CategoriesCompanion.insert(name: "Income"),
              CategoriesCompanion.insert(name: "Food"),
              CategoriesCompanion.insert(name: "Rent"),
              CategoriesCompanion.insert(name: "Services"),
              CategoriesCompanion.insert(name: "Entertainment"),
              CategoriesCompanion.insert(name: "Other"),
            ]));
      }
    });
  }
}
