import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
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
              const BalanceView(),
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
