import 'category.dart';

class CategoriesRepository {
  Future<List<Category>> getAllCategories() {
    return Future.value(Category.all);
  }
}
