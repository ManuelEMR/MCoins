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
    return Provider<CreateRecordBloc>(
      create: (_) => CreateRecordBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: PlatformScaffold(
        title: const Text("Crear"),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRecordBloc>(context);
    print("Recreated");
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: "100.00",
              labelText: "Cantidad",
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: const InputDecoration(
              alignLabelWithHint: true,
              hintText: "...",
              labelText: "Notas",
            ),
            onChanged: bloc.note.add,
            maxLines: 5,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 8),
          StreamBuilder<Category>(
            stream: bloc.selectedCategory,
            builder: (context, snapshot) {
              return DropdownButton<Category>(
                hint: const Text("Categoría"),
                value: snapshot.data,
                onChanged: bloc.category.add,
                items: Category.all
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(c.name),
                      ),
                    )
                    .toList(),
              );
            },
          ),
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
}
