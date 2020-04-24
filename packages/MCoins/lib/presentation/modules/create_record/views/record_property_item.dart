import 'package:flutter/material.dart';

class RecordPropertyItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;

  const RecordPropertyItem({this.iconData, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.white,
      width: double.maxFinite,
      child: Row(
        children: [
          const SizedBox(width: 32),
          Icon(iconData, size: 50),
          const SizedBox(width: 32),
          Column(
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
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
