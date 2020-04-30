import 'package:flutter/material.dart';

class PreviousRecordItem extends StatelessWidget {
  final Color color;
  final String categoryName;
  final String amount;
  final String date;

  const PreviousRecordItem(
      {this.categoryName, this.amount, this.color, this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
            width: 4,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        height: 80,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    categoryName,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.start,
                  ),
                  Text(date, style: Theme.of(context).textTheme.caption)
                ],
              ),
            ),
            Text(
              '$amount\$',
              textAlign: TextAlign.end,
              style:
                  Theme.of(context).textTheme.subtitle1.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
