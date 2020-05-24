import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:flutter/material.dart';

import 'balance_item.dart';
import 'models/balance.dart';

class BalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: const Text('Balance'),
      child: ListView.separated(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: BalanceItem(
                balance: Balance('May 2020', 2000, 1000)),
          );
        },
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey),
        ),
        itemCount: 20,
      ),
    );
  }
}
