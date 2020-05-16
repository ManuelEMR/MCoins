import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/category_detail/category_detail_bloc.dart';
import 'package:MCoins/presentation/modules/category_detail/category_detail_router.dart';
import 'package:MCoins/presentation/modules/category_detail/date_header_view.dart';
import 'package:MCoins/presentation/modules/home/recents/previous_record_item.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_view.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

import 'models/item_type.dart';

class CategoryDetailScreen extends StatelessWidget {
  final Category category;
  final _router = injector.get<CategoryDetailRouter>();

  CategoryDetailScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryDetailBloc>(
      configurator: (bloc) => bloc.getRecords(category),
      child: Container(
        decoration: GradientBoxDecoration(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight
          ],
        ),
        child: PlatformScaffold(
          title: Text(category.name),
          appBarBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          barActions: <Widget>[
            IconButton(
              onPressed: () => _router.openCreateRecord(context, category),
              icon: Icon(Icons.add),
            )
          ],
          child: _List(
            category: category,
          ),
        ),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final Category category;
  const _List({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CategoryDetailBloc>(context);
    return StreamBuilder<List<ItemType>>(
      stream: bloc.items,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'No transactions for this category, press the add button to add a new one!',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 16),
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return item.when(
                header: (date) => DateHeaderView(date: date.monthYearFormat),
                item: (record) => PreviousRecordItem.fromModel(
                    RecordWithCategory(record, category),
                    backgroundColor: Colors.white),
              );
            },
          );
        }
      },
    );
  }
}
