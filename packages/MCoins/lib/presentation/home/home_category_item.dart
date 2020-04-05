import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final Color backgroundColor;
  final String categoryTitle;

  const HomeCategoryItem(this.categoryTitle, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: backgroundColor,
        child: Center(
          child: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
