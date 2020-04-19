import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:MCoins/presentation/modules/create_record/validators.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:records_db/records_db.dart';

class CreateRecordScreen extends StatefulWidget {
  @override
  _CreateRecordScreenState createState() => _CreateRecordScreenState();
}

class _CreateRecordScreenState extends State<CreateRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateRecordBloc>(
      child: PlatformScaffold(
        title: const Text("Crear"),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _amountFocusNode = FocusNode();
  final _notesFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  final _dateTextController = TextEditingController();
  var _autovalidate = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRecordBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 16),
            TextFormField(
              focusNode: _amountFocusNode,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                hintText: "100.00",
                labelText: "Cantidad",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: isNotEmpty,
              onChanged: bloc.amount.add,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _amountFocusNode, _notesFocusNode),
            ),
            const SizedBox(height: 16),
            TextFormField(
                focusNode: _notesFocusNode,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  hintText: "Tus notas...",
                  labelText: "Notas",
                  border: OutlineInputBorder(),
                ),
                onChanged: bloc.note.add,
                maxLines: 5,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return isNotEmpty(value) ?? maxLength(value, 50);
                },
                onFieldSubmitted: (_) {
                  _notesFocusNode.unfocus();
                  _pickDate();
                }),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: _pickDate,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateTextController,
                  focusNode: _dateFocusNode,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Fecha",
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  validator: isNotEmpty,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const _CategoryPicker(),
            const SizedBox(height: 24),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              onPressed: _createRecord,
              child: const Text("AGREGAR"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _dateTextController.text = DateFormat.MMMMd().format(date);
    Provider.of<CreateRecordBloc>(context, listen: false).addDate(date);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _createRecord() {
    if (_formKey.currentState.validate()) {
      Provider.of<CreateRecordBloc>(context, listen: false).create();
    } else {
      _autovalidate = true;
    }
  }

  void _pickDate() {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();
    final bloc = Provider.of<CreateRecordBloc>(context, listen: false);
    showDatePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      initialDate: now,
      lastDate: DateTime(now.year + 1),
    ).then((date) {
      if (date == null) return;
      bloc.addDate(date);
      _dateTextController.text = DateFormat.MMMMd().format(date);
    });
  }
}

class _CategoryPicker extends StatelessWidget {
  const _CategoryPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRecordBloc>(context);

    return StreamBuilder<List<Category>>(
      stream: bloc.categories,
      builder: (_, AsyncSnapshot<List<Category>> snapshot) {
        final categories = snapshot.data ?? [];
        return StreamBuilder<Category>(
          stream: bloc.selectedCategory,
          builder: (context, snapshot) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400], width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<Category>(
                isExpanded: true,
                hint: Text(
                  "Categoría",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.black87, fontSize: 16),
                ),
                value: snapshot.data,
                onChanged: bloc.category.add,
                items: categories
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(c.name),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
