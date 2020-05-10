import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/home_category_item.dart';
import 'package:MCoins/presentation/foundation/extensions/category_color.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class CategoryList extends StatelessWidget {
  final _router = injector.get<HomeRouter>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CategoriesBloc>(context);
    return StreamBuilder<List<Category>>(
      stream: bloc.categories,
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? [];
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 0.3,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => _router.openCategoryDetail(context, categories[index]),
            child: HomeCategoryItem(
              title: categories[index].name,
              detailColor: categories[index].color,
            ),
          ),
        );
      },
    );
  }
}
