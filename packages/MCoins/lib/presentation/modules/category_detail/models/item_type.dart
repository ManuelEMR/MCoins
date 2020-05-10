import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:records_db/records_db.dart';

part 'item_type.freezed.dart';

@freezed
abstract class ItemType with _$ItemType {
  const factory ItemType.header() = Header;
  const factory ItemType.item({RecordWithCategory recordWithCategory}) = Item;
}
