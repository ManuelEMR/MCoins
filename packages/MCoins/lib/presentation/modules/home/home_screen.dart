import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/home/balance/balance_view.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/home_category_list.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_bloc.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_view.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final _router = injector.get<HomeRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CategoriesBloc>(),
        BlocProvider<RecentRecordsBloc>()
      ],
      child: PlatformScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const BalanceView(),
              // const SizedBox(height: 8),
              // Container(height: 160, child: CategoryList()),
              // const SizedBox(height: 8),
              RecentRecordsView(),
            ],
          ),
        ),
      ),
    );
  }

  void _addNewExpense(BuildContext context) {
    _router.openCreateRecord(context);
  }
}
