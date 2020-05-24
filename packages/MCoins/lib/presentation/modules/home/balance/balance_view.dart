import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/modules/home/balance/balance_clipper.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceView extends StatefulWidget {
  final _router = injector.get<HomeRouter>();
  BalanceView();

  @override
  _BalanceViewState createState() => _BalanceViewState();
}

class _BalanceViewState extends State<BalanceView> {
  bool _isShowingHistorical = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ClipPath(
      clipper: const BalanceClipper(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: GradientBoxDecoration(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight
          ],
        ),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          top: true,
          child: GestureDetector(
            onTap: () =>
                setState(() => _isShowingHistorical = !_isShowingHistorical),
            child: SizedBox.expand(
              child: Stack(alignment: Alignment.center, children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: _isShowingHistorical
                      ? _HistoricalBalance(textTheme: textTheme)
                      : _MonthlyBalance(),
                ),
                Align(
                  alignment: const Alignment(0.7, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      onPressed: () => widget._router.openBalanceScreen(context),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoricalBalance extends StatelessWidget {
  const _HistoricalBalance({Key key, @required this.textTheme})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'BALANCE',
          style: textTheme.headline6.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          '193\$',
          style: textTheme.headline4
              .copyWith(color: Colors.white, fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}

class _MonthlyBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
    final month = DateFormat.MMMM().format(now);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          month,
          style: textTheme.headline6.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            '1930\$',
            style: textTheme.headline6
                .copyWith(color: Colors.green, fontWeight: FontWeight.w900),
          ),
          const SizedBox(width: 8),
          Text(
            '193\$',
            style: textTheme.headline6
                .copyWith(color: Colors.red, fontWeight: FontWeight.w900),
          )
        ])
      ],
    );
  }
}
