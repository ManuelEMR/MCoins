import 'package:MCoins/presentation/foundation/views/border_decoration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/balance.dart';

class BalanceItem extends StatelessWidget {
  final Balance balance;

  const BalanceItem({@required this.balance});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formatter = NumberFormat.currency(name: '');
    return BorderDecoration(
      borderColor: Colors.grey[200],
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('May 2020', style: textTheme.headline6),
            const SizedBox(height: 16),
            Row(
              children: <Widget>[
                Text(
                  'Balance:',
                  style: textTheme.bodyText1.copyWith(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Text(formatter.format(balance.balance).toString())
              ],
            ),
            Row(
              children: <Widget>[
                Text('Income:', style: textTheme.bodyText1),
                const SizedBox(width: 8),
                Text(formatter.format(balance.income).toString())
              ],
            ),
            Row(
              children: <Widget>[
                Text('Expenses:', style: textTheme.bodyText1),
                const SizedBox(width: 8),
                Text(formatter.format(balance.income))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
