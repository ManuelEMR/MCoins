import 'package:MCoins/presentation/modules/home/categories/home_category_list.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 130, child: CategoryList()),
      ],
    );
  }
}
