import 'package:MCoins/presentation/modules/home/recents/recent_records_bloc.dart';
import 'package:MCoins/presentation/modules/home/recents/previous_record_item.dart';
import 'package:MCoins/presentation/foundation/extensions/category_color.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class RecentRecordsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecentRecordsBloc>(context);
    return Column(
      children: <Widget>[
        Text('Recent Spendings', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 24),
        StreamBuilder<List<RecordWithCategory>>(
          stream: bloc.records,
          builder: (context, AsyncSnapshot<List<RecordWithCategory>> snapshot) {
            final records = snapshot.data ?? [];
            final items = records
                .take(10)
                .map((r) => PreviousRecordItem(
                      categoryName: r.category.name,
                      amount: r.record.amount.toString(),
                      color: r.category.color,
                      date: r.record.createdAt.shortFormat,
                    ))
                .toList();
            return Column(children: items);
          },
        ),
      ],
    );
  }
}
