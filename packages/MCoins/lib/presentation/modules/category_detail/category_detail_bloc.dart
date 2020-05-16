import 'dart:async';

import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/category_detail/models/item_type.dart';
import 'package:records_db/records_db.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart' as CollectionUtils;

class CategoryDetailBloc extends BaseBloc {
  Stream<List<ItemType>> get items => _items.stream;

  final _items = BehaviorSubject<List<ItemType>>.seeded([]);
  StreamSubscription _recordsSubscription;
  Category _watchedCategory;

  final RecordsRepository _recordsRepository;

  CategoryDetailBloc(this._recordsRepository);

  void getRecords(Category category) {
    if (category.id == _watchedCategory?.id) return;

    _watchedCategory = category;
    _recordsSubscription?.cancel();
    _recordsSubscription = _recordsRepository
        .watchRecordsForCategory(category.id)
        .map((records) => CollectionUtils.groupBy<Record, int>(
            records, (r) => r.createdAt.month))
        .map((grouped) {
          final list = <ItemType>[];
          grouped.forEach((key, records) {
            list.add(ItemType.header(date: records.first.createdAt));
            records.forEach((r) => list.add(ItemType.item(record: r)));
          });
          return list;
        })
        .listen(_items.add, onError: (Object e) {
          print("ERROR $e");
          return <ItemType>[];
        });
  }
}
