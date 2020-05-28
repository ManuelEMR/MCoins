import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/modules/home/home_router.dart';
import 'package:MCoins/presentation/modules/home/recents/recent_records_bloc.dart';
import 'package:MCoins/presentation/modules/home/recents/previous_record_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class RecentRecordsView extends StatelessWidget {
  final _router = injector.get<HomeRouter>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecentRecordsBloc>(context);
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Text('Recent Spendings',
                    style: Theme.of(context).textTheme.headline6),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addNewExpense(context),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          StreamBuilder<List<RecordWithCategory>>(
            stream: bloc.records,
            builder:
                (context, AsyncSnapshot<List<RecordWithCategory>> snapshot) {
              final records = snapshot.data ?? [];
              final items = records.take(10).map((r) {
                return GestureDetector(
                  onTap: () => _editRecord(context, r),
                  child: PreviousRecordItem.fromModel(r),
                );
              }).toList();
              return items.isEmpty
                  ? _EmptyRecordsView()
                  : Column(children: items);
            },
          ),
        ],
      ),
    );
  }

  void _addNewExpense(BuildContext context) {
    _router.openCreateRecord(context);
  }

  void _editRecord(
      BuildContext context, RecordWithCategory recordWithCategory) {
    _router.openCreateRecord(context, recordWithCategory);
  }
}

class _EmptyRecordsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No available records'),
    );
  }
}
