import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:MCoins/presentation/modules/home/categories/home_category_list.dart';
import 'package:MCoins/presentation/modules/home/historic/historic_bloc.dart';
import 'package:MCoins/presentation/modules/home/historic/historic_record_list.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final _router = injector.get<HomeRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [BlocProvider<CategoriesBloc>(), BlocProvider<HistoricBloc>()],
      child: PlatformScaffold(
        title: const Text("MCoins"),
        barActions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addNewExpense(context),
          )
        ],
        child: ListView(
          children: <Widget>[
            Container(height: 160, child: CategoryList()),
            const SizedBox(height: 8),
            HistoricRecordList(),
          ],
        ),
      ),
    );
  }

  void _addNewExpense(BuildContext context) {
    _router.openCreateRecord(context);
  }
}
