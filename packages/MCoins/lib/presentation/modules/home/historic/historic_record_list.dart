import 'package:MCoins/presentation/modules/home/historic/historic_bloc.dart';
import 'package:MCoins/presentation/modules/home/historic/previous_record_item.dart';
import 'package:MCoins/presentation/modules/home/models/category_record.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoricRecordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HistoricBloc>(context);
    return StreamBuilder<List<CategoryRecord>>(
        stream: bloc.records,
        builder: (context, AsyncSnapshot<List<CategoryRecord>> snapshot) {
          final records = snapshot.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (_, int index) {
              return PreviousRecordItem(
                categoryName: "TODO",
                amount: "00",
                color: Colors.teal,
              );
            },
            itemCount: records.length,
          );
        });
  }
}
