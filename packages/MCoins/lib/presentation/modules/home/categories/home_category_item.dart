import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final Color detailColor;
  final String title;

  const HomeCategoryItem({this.title, this.detailColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: detailColor.withAlpha(50),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
