import 'package:flutter/material.dart';

class BalanceView extends StatelessWidget {
  const BalanceView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'April',
              style: textTheme.headline4.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 16),
            Text('122\$',
                style: textTheme.headline4.copyWith(color: Colors.green)),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('122\$',
                    style: textTheme.subtitle2.copyWith(color: Colors.green)),
                const SizedBox(width: 4),
                Text('0\$',
                    style: textTheme.subtitle2.copyWith(color: Colors.red)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
