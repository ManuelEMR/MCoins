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
            children: const [_TopBar(), SizedBox(height: 32), _InnerCard()],
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
            RecordPropertyItem(
              iconData: Icons.attach_money,
              title: 'Amount',
              subtitle: Container(
                width: 200,
                child: TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: '999\$',
                  ),
                ),
              ),
            ),
            // RecordPropertyItem(
            //   iconData: Icons.edit,
            //   title: 'Note',
            //   subtitle: const TextField(
            //     maxLines: 1,
            //     keyboardType: TextInputType.number,
            //     textInputAction: TextInputAction.next,
            //   ),
            // ),
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
