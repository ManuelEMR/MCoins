import 'package:flutter/material.dart';

class RecordPropertyItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Widget subtitle;

  const RecordPropertyItem({this.iconData, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 32),
          Icon(iconData, size: 40, color: Colors.black),
          const SizedBox(width: 32),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                subtitle
              ],
            ),
          )
        ],
      ),
    );
  }
}
