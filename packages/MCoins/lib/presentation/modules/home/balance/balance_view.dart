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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight
            ],
            begin: const Alignment(0, 0),
            end: const Alignment(1, 1),
          ),
        ),
        height: 300,
        child: Center(
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
                  style: textTheme.headline6
                      .copyWith(color: Colors.white, fontFamily: 'Montserrat'),
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
