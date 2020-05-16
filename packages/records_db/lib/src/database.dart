import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:records_db/src/categories/categories_dao.dart';
import 'package:records_db/src/categories/category_table.dart';
import 'package:records_db/src/records/records_dao.dart';
import 'package:records_db/src/records/records_table.dart';

part 'database.g.dart';

@UseMoor(tables: [Categories, Records], daos: [CategoriesDao, RecordsDao])
class RecordsDatabase extends _$RecordsDatabase {
  RecordsDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      debugPrint("DB version: ${details.versionNow}");
      if (details.wasCreated) {
        // add default categories
        await batch(
          (b) => b.insertAll(categories, [
            CategoriesCompanion.insert(name: "Salary", isExpense: false),
            CategoriesCompanion.insert(name: "Deposits", isExpense: false),
            CategoriesCompanion.insert(name: "Food", isExpense: true),
            CategoriesCompanion.insert(name: "Rent", isExpense: true),
            CategoriesCompanion.insert(name: "Services", isExpense: true),
            CategoriesCompanion.insert(name: "Transportation", isExpense: true),
            CategoriesCompanion.insert(name: "Entertainment", isExpense: true),
            CategoriesCompanion.insert(name: "Sports", isExpense: true),
            CategoriesCompanion.insert(name: "Other", isExpense: true),
          ]),
        );
      }
    });
  }
}
