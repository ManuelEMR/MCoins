import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/create_record/validators.dart';
import 'package:MCoins/presentation/modules/create_record/views/record_property_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class CreateRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          decoration: GradientBoxDecoration(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _TopBar(),
              const SizedBox(height: 32),
              const _InnerCard()
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: const Alignment(-0.95, 0),
          child: IconButton(
            icon: const Icon(Icons.close),
            color: Colors.white,
            onPressed: () => _pop(context),
          ),
        ),
        Text(
          'New Transaction',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }

  void _pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _InnerCard extends StatelessWidget {
  const _InnerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              GestureDetector(
                onTap: () => _showDatePicker(context),
                child: RecordPropertyItem(
                  iconData: Icons.calendar_today,
                  title: 'Date',
                  subtitle: 'May 25, 2018',
                ),
              ),
              RecordPropertyItem(
                iconData: Icons.details,
                title: 'Category',
                subtitle: 'Coffee',
              ),
              RecordPropertyItem(
                iconData: Icons.attach_money,
                title: 'Amount',
                subtitle: '356\$',
              ),
              RecordPropertyItem(
                iconData: Icons.edit,
                title: 'Note',
                subtitle: 'Write something...',
              )
            ],
          )),
    );
  }

  void _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      initialDate: now,
      lastDate: DateTime(now.year + 1),
    );
  }
}
