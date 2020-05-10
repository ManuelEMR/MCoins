import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/category_detail/models/item_type.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart' as CollectionUtils;

class CategoryDetailBloc extends BaseBloc {
  Stream<List<ItemType>> get items => _items.stream;

  final _items = BehaviorSubject<List<ItemType>>.seeded([]);

  final RecordsRepository _recordsRepository;

  CategoryDetailBloc(this._recordsRepository);

  void getRecords(Category category) {
    _recordsRepository
        .getRecordsForCategory(category.id)
        .then((records) => CollectionUtils.groupBy<Record, int>(
            records, (r) => r.createdAt.month))
        .then((grouped) {
          final list = <ItemType>[];
          grouped.forEach((key, records) {
            list.add(ItemType.header(date: records.first.createdAt));
            records.forEach((r) => list.add(ItemType.item(record: r)));
          });
          return list;
        })
        .then(_items.add)
        .catchError((Object e) {
          print("ERROR $e");
          return <ItemType>[];
        });
  }
}
