import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/balance/models/balance.dart';
import 'package:MCoins/presentation/modules/home/balance/balance_view.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_view.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_bloc.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [BlocProvider<RecentRecordsBloc>()],
      child: PlatformScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Consumer<RecentRecordsBloc>(
                builder: (context, bloc, _) => StreamBuilder<Balance>(
                  stream: bloc.balance,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();

                    return BalanceView(balance: snapshot.data);
                  },
                ),
              ),
              const SizedBox(height: 32),
              const CategoriesView(),
              const SizedBox(height: 32),
              RecentRecordsView(),
            ],
          ),
        ),
      ),
    );
  }
}
