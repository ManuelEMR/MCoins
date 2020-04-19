import 'package:MCoins/presentation/modules/home/historic/historic_bloc.dart';
import 'package:MCoins/presentation/modules/home/historic/previous_record_item.dart';
import 'package:MCoins/presentation/foundation/extensions/category_color.dart';
import 'package:MCoins/presentation/foundation/extensions/datetime_formatting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class HistoricRecordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HistoricBloc>(context);
    return StreamBuilder<List<RecordWithCategory>>(
        stream: bloc.records,
        builder: (context, AsyncSnapshot<List<RecordWithCategory>> snapshot) {
          final records = snapshot.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (_, int index) {
              final record = records[index];
              return PreviousRecordItem(
                categoryName: record.category.name,
                amount: record.record.amount.toString(),
                color: record.category.color,
                date: record.record.createdAt.shortFormat,
              );
            },
            itemCount: records.length,
          );
        });
  }
}
