import 'package:MCoins/presentation/foundation/views/border_decoration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:records_db/records_db.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:MCoins/presentation/foundation/extensions/category_color.dart';

class PreviousRecordItem extends StatelessWidget {
  final Color color;
  final String categoryName;
  final String amount;
  final String date;
  final Color backgroundColor;

  const PreviousRecordItem(
      {this.categoryName,
      this.amount,
      this.color,
      this.date,
      this.backgroundColor});

  PreviousRecordItem.fromModel(RecordWithCategory recordWithCategory,
      {this.backgroundColor})
      : categoryName = recordWithCategory.category.name,
        amount = NumberFormat.currency(name: '')
            .format(recordWithCategory.record.amount)
            .toString(),
        date = recordWithCategory.record.createdAt.shortFormat,
        color = recordWithCategory.category.color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: BorderDecoration(
        height: 80,
        borderColor: Colors.grey[200],
        backgroundColor: backgroundColor,
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
