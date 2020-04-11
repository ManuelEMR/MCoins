import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final Color backgroundColor;
  final String title;

  const HomeCategoryItem({this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
