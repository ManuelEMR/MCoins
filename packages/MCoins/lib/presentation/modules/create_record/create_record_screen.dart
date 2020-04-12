import 'package:MCoins/presentation/foundation/bloc_provider.dart';
import 'package:MCoins/presentation/foundation/views/platform_scaffold.dart';
import 'package:MCoins/presentation/modules/create_record/create_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:records_repo/records_repo.dart';

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
  final amountFocusNode = FocusNode();
  final notesFocusNode = FocusNode();
  final dateFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRecordBloc>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          TextField(
            focusNode: amountFocusNode,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: "100.00",
              labelText: "Cantidad",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) =>
                _fieldFocusChange(context, amountFocusNode, notesFocusNode),
          ),
          const SizedBox(height: 16),
          TextField(
            focusNode: notesFocusNode,
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
            onSubmitted: (_) =>
                _fieldFocusChange(context, notesFocusNode, dateFocusNode),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            focusNode: dateFocusNode,
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              labelText: "Fecha",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          const _CategoryPicker(),
          const SizedBox(height: 24),
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: bloc.create,
            child: const Text("AGREGAR"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    dateFocusNode.addListener(() {
      if (dateFocusNode.hasFocus) {}
    });
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
            return DropdownButton<Category>(
              hint: Text(
                "Categoría",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.grey),
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
            );
          },
        );
      },
    );
  }
}
