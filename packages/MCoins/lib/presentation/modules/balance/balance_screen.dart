import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/gradient_container.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'balance_bloc.dart';
import 'balance_item.dart';
import 'models/balance.dart';

class BalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BalanceBloc>(
      child: GradientContainer(
        child: PlatformScaffold(
          title: const Text('Balance', style: TextStyle(color: Colors.white),),
          appBarBackgroundColor: Theme.of(context).primaryColor,
          actionsColor: Colors.white,
          cupertinoBorder: null,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const _BalanceList(),
        ),
      ),
    );
  }
}

class _BalanceList extends StatelessWidget {
  const _BalanceList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<BalanceBloc>(context);
    return StreamBuilder<List<Balance>>(
        stream: bloc.balances,
        initialData: const [],
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.builder(
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: BalanceItem(balance: snapshot.data[index]),
              );
            },
            itemCount: snapshot.data.length,
          );
        });
  }
}
