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
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$amount\$',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            const SizedBox(width: 16),
            Container(
              width: 4,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
