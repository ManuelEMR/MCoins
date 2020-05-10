import 'package:MCoins/presentation/foundation/base_bloc.dart';
import 'package:MCoins/presentation/modules/category_detail/models/item_type.dart';
import 'package:rxdart/rxdart.dart';

class CategoryDetailBloc extends BaseBloc {
  Stream<List<ItemType>> get items => _items.stream;

  final _items = BehaviorSubject<List<ItemType>>.seeded([]);
}
