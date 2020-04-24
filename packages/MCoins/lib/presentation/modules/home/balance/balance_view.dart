import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/modules/home/balance/balance_clipper.dart';
import 'package:flutter/material.dart';

class BalanceView extends StatelessWidget {
  const BalanceView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ClipPath(
      clipper: const BalanceClipper(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.only(top: 64),
        decoration: GradientBoxDecoration(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight
          ],
        ),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'BALANCE',
                  style: textTheme.headline6.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  '193\$',
                  style: textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
