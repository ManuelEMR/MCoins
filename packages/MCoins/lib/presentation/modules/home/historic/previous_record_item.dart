import 'package:flutter/material.dart';

class PreviousRecordItem extends StatelessWidget {
  final Color color;
  final String categoryName;
  final String amount;

  const PreviousRecordItem({this.categoryName, this.amount, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Expanded(child: Text(categoryName)),
            Text(amount),
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
