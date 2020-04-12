import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/home_category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CategoriesBloc>(context);
    return StreamBuilder<List<Category>>(
      stream: bloc.categories,
      builder: (context, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? [];
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            return HomeCategoryItem(
              title: categories[index].name,
              backgroundColor: Colors.red,
            );
          },
          itemCount: categories.length ?? 0,
        );
      },
    );
  }
}
