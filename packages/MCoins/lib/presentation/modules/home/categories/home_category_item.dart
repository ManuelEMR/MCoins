import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final Color detailColor;
  final String title;

  const HomeCategoryItem({this.title, this.detailColor});

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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: double.maxFinite,
                width: 4,
                color: detailColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
