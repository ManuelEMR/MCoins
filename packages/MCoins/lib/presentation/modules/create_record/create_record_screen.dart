import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/create_record/views/record_property_item.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class CreateRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GradientBoxDecoration(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorLight
        ],
      ),
      child: PlatformScaffold(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('New Transaction'),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 32),
              SingleChildScrollView(child: _InnerCard()),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _InnerCard extends StatefulWidget {
  const _InnerCard();

  @override
  __InnerCardState createState() => __InnerCardState();
}

class __InnerCardState extends State<_InnerCard> {
  final _amountFocus = FocusNode();
  final _noteFocus = FocusNode();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _showDatePicker(context),
              child: RecordPropertyItem(
                iconData: Icons.calendar_today,
                title: 'Date',
                subtitle: Text(
                  'May 25, 2018',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showCategoryBottomBar(context),
              child: RecordPropertyItem(
                iconData: Icons.details,
                title: 'Category',
                subtitle: Text(
                  'Coffee',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: _amountFocus.requestFocus,
              child: RecordPropertyItem(
                iconData: Icons.attach_money,
                title: 'Amount',
                subtitle: Container(
                  width: double.maxFinite,
                  child: TextField(
                    focusNode: _amountFocus,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) {
                      _noteFocus.requestFocus();
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: '999\$',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _noteFocus.requestFocus,
              child: RecordPropertyItem(
                iconData: Icons.edit,
                title: 'Note',
                subtitle: TextField(
                  focusNode: _noteFocus,
                  maxLines: 1,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    _noteFocus.unfocus();
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Notes...',
                      counterText: ""),
                ),
              ),
            ),
          ],
        ),
      ),
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

  void _showCategoryBottomBar(BuildContext context) {
    final bloc = Provider.of<CategoriesBloc>(context, listen: false);
    final node = FocusScope.of(context);
    if (!node.hasPrimaryFocus) node.unfocus();
    showModalBottomSheet<Category>(
      context: context,
      builder: (context) {
        return StreamBuilder<List<Category>>(
          stream: bloc.categories,
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            final categories = snapshot.data ?? [];
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pop(categories[index]),
                child: _CategoryTile(category: categories[index]),
              ),
            );
          },
        );
      },
    ).then((value) {
      if (value != null) print("Category: $value");
    });
  }
}

class _CategoryTile extends StatelessWidget {
  final Category category;

  const _CategoryTile({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 60,
      width: double.maxFinite,
      child: Text(category.name, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
