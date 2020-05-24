import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/gradient_box_decoration.dart';
import 'package:MCoins/presentation/foundation/views/gradient_container.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/create_record/views/record_property_item.dart';
import 'package:MCoins/presentation/modules/home/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:records_db/records_db.dart';
import 'package:tuple/tuple.dart';

class CreateRecordScreen extends StatelessWidget {
  final RecordWithCategory recordWithCategory;

  const CreateRecordScreen({this.recordWithCategory});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpsertRecordBloc>(
      configurator: (UpsertRecordBloc bloc) => bloc.prefill(recordWithCategory),
      child: GradientContainer(
        child: PlatformScaffold(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Consumer<UpsertRecordBloc>(
            builder: (_, bloc, __) => Text(bloc.title),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                _Body(recordWithCategory: recordWithCategory),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final RecordWithCategory recordWithCategory;
  const _Body({Key key, this.recordWithCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<UpsertRecordBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          _InnerCard(recordWithCategory: recordWithCategory),
          const SizedBox(height: 32),
          StreamBuilder<Tuple2<bool, String>>(
              stream: CombineLatestStream.combine2(
                  bloc.isCreateButtonEnabled,
                  bloc.buttonText,
                  (bool isEnabled, String text) =>
                      Tuple2<bool, String>(isEnabled, text)),
              initialData: const Tuple2(false, ''),
              builder: (context, snapshot) {
                return OutlineButton(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  onPressed: snapshot.data.item1
                      ? () => createTransaction(context)
                      : null,
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  disabledBorderColor: Colors.black54,
                  shape: const StadiumBorder(),
                  borderSide: BorderSide(
                      color: Theme.of(context).accentColor, width: 3),
                  child: Text(snapshot.data.item2),
                );
              })
        ],
      ),
    );
  }

  void createTransaction(BuildContext context) {
    final bloc = Provider.of<UpsertRecordBloc>(context, listen: false);
    bloc
        .upsert()
        .then((value) => Navigator.of(context).pop())
        .catchError((Object e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: 'Failed to create transaction');
      return null;
    });
  }
}

class _InnerCard extends StatefulWidget {
  final RecordWithCategory recordWithCategory;
  const _InnerCard({this.recordWithCategory});

  @override
  _InnerCardState createState() => _InnerCardState();
}

class _InnerCardState extends State<_InnerCard> {
  final _amountFocus = FocusNode();
  final _noteFocus = FocusNode();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<UpsertRecordBloc>(context);
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
              child: StreamBuilder<String>(
                  stream: bloc.date,
                  builder: (context, snapshot) {
                    return RecordPropertyItem(
                      iconData: Icons.calendar_today,
                      title: 'Date',
                      subtitle: Text(
                        snapshot.data ?? '',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ),
            GestureDetector(
              onTap: () => _showCategoryBottomBar(context),
              child: StreamBuilder<String>(
                  stream: bloc.selectedCategory.map((c) => c.name),
                  initialData: "Category...",
                  builder: (context, snapshot) {
                    return RecordPropertyItem(
                      iconData: Icons.details,
                      title: 'Category',
                      subtitle: Text(
                        snapshot.data,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
            ),
            GestureDetector(
              onTap: _amountFocus.requestFocus,
              child: RecordPropertyItem(
                iconData: Icons.attach_money,
                title: 'Amount',
                subtitle: Container(
                  width: double.maxFinite,
                  child: TextField(
                    controller: _amountController,
                    focusNode: _amountFocus,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: '999\$',
                    ),
                    onSubmitted: (_) {
                      _noteFocus.requestFocus();
                    },
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
                  controller: _noteController,
                  focusNode: _noteFocus,
                  maxLines: 1,
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Notes...',
                    counterText: "",
                  ),
                  onSubmitted: (_) {
                    _noteFocus.unfocus();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final bloc = Provider.of<UpsertRecordBloc>(context, listen: false);
    _amountController.text =
        widget.recordWithCategory?.record?.amount?.toString();
    _amountController.addListener(() {
      bloc.addAmount(_amountController.text);
    });

    _noteController.text = widget.recordWithCategory?.record?.notes;
    _noteController.addListener(() {
      bloc.addNote(_noteController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _amountController.dispose();
    _noteController.dispose();
  }

  void _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    final bloc = Provider.of<UpsertRecordBloc>(context, listen: false);
    showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      initialDate: now,
      lastDate: DateTime(now.year + 1),
    ).then((date) {
      if (date != null) bloc.addDate(date);
    });
  }

  void _showCategoryBottomBar(BuildContext context) {
    final categoriesBloc = Provider.of<CategoriesBloc>(context, listen: false);
    final bloc = Provider.of<UpsertRecordBloc>(context, listen: false);
    final node = FocusScope.of(context);
    if (!node.hasPrimaryFocus) node.unfocus();
    showModalBottomSheet<Category>(
      context: context,
      builder: (context) {
        return StreamBuilder<List<Category>>(
          stream: categoriesBloc.categories,
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            final categories = snapshot.data ?? [];
            return ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(categories[index]);
                },
                child: _CategoryTile(category: categories[index]),
              ),
            );
          },
        );
      },
    ).then((value) {
      if (value != null) bloc.setCategory(value);
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
