import 'package:MCoins/presentation/foundation/views/gradient_container.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:flutter/material.dart';

import 'balance_item.dart';
import 'models/balance.dart';

class BalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: PlatformScaffold(
        title: const Text('Balance'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ListView.builder(
          itemBuilder: (_, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: BalanceItem(balance: Balance(DateTime.now(), 2000, 1000)),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
