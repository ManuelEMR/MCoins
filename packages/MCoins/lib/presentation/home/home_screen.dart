import 'package:MCoins/presentation/category.dart';
import 'package:MCoins/presentation/foundation/platform_scaffold.dart';
import 'package:MCoins/presentation/home/home_category_item.dart';
import 'package:MCoins/presentation/home/models/home_record.dart';
import 'package:MCoins/presentation/home/previous_record_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: const Text("MCoins"),
      barActions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _addNewExpense,
        )
      ],
      child: Column(
        children: <Widget>[
          Container(height: 160, child: _CategoryList()),
          const SizedBox(height: 8),
          _PreviousExpensesList(),
        ],
      ),
    );
  }

  void _addNewExpense() {}
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return HomeCategoryItem(
          title: Category.all[index].name,
          backgroundColor: Category.all[index].color,
        );
      },
      itemCount: Category.all.length,
    );
  }
}

class _PreviousExpensesList extends StatelessWidget {
  final _previousRecord = <HomeRecord>[
    HomeRecord(Category.food.name, "-2000", Category.food.color),
    HomeRecord(Category.income.name, "70000", Category.food.color),
    HomeRecord(Category.rent.name, "-21000", Category.food.color),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return PreviousRecordItem(
          categoryName: _previousRecord[index].category,
          amount: _previousRecord[index].amount,
          color: _previousRecord[index].color,
        );
      },
      itemCount: _previousRecord.length,
    );
  }
}
