// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'item_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ItemTypeTearOff {
  const _$ItemTypeTearOff();

  Header header({DateTime date}) {
    return Header(
      date: date,
    );
  }

  Item item({Record record}) {
    return Item(
      record: record,
    );
  }
}

// ignore: unused_element
const $ItemType = _$ItemTypeTearOff();

mixin _$ItemType {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(DateTime date),
    @required Result item(Record record),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(DateTime date),
    Result item(Record record),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result header(Header value),
    @required Result item(Item value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result header(Header value),
    Result item(Item value),
    @required Result orElse(),
  });
}

abstract class $ItemTypeCopyWith<$Res> {
  factory $ItemTypeCopyWith(ItemType value, $Res Function(ItemType) then) =
      _$ItemTypeCopyWithImpl<$Res>;
}

class _$ItemTypeCopyWithImpl<$Res> implements $ItemTypeCopyWith<$Res> {
  _$ItemTypeCopyWithImpl(this._value, this._then);

  final ItemType _value;
  // ignore: unused_field
  final $Res Function(ItemType) _then;
}

abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

class _$HeaderCopyWithImpl<$Res> extends _$ItemTypeCopyWithImpl<$Res>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(Header _value, $Res Function(Header) _then)
      : super(_value, (v) => _then(v as Header));

  @override
  Header get _value => super._value as Header;

  @override
  $Res call({
    Object date = freezed,
  }) {
    return _then(Header(
      date: date == freezed ? _value.date : date as DateTime,
    ));
  }
}

class _$Header implements Header {
  const _$Header({this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'ItemType.header(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Header &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @override
  $HeaderCopyWith<Header> get copyWith =>
      _$HeaderCopyWithImpl<Header>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(DateTime date),
    @required Result item(Record record),
  }) {
    assert(header != null);
    assert(item != null);
    return header(date);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(DateTime date),
    Result item(Record record),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (header != null) {
      return header(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result header(Header value),
    @required Result item(Item value),
  }) {
    assert(header != null);
    assert(item != null);
    return header(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result header(Header value),
    Result item(Item value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class Header implements ItemType {
  const factory Header({DateTime date}) = _$Header;

  DateTime get date;
  $HeaderCopyWith<Header> get copyWith;
}

abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({Record record});
}

class _$ItemCopyWithImpl<$Res> extends _$ItemTypeCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(Item _value, $Res Function(Item) _then)
      : super(_value, (v) => _then(v as Item));

  @override
  Item get _value => super._value as Item;

  @override
  $Res call({
    Object record = freezed,
  }) {
    return _then(Item(
      record: record == freezed ? _value.record : record as Record,
    ));
  }
}

class _$Item implements Item {
  const _$Item({this.record});

  @override
  final Record record;

  @override
  String toString() {
    return 'ItemType.item(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Item &&
            (identical(other.record, record) ||
                const DeepCollectionEquality().equals(other.record, record)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(record);

  @override
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(DateTime date),
    @required Result item(Record record),
  }) {
    assert(header != null);
    assert(item != null);
    return item(record);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(DateTime date),
    Result item(Record record),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (item != null) {
      return item(record);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result header(Header value),
    @required Result item(Item value),
  }) {
    assert(header != null);
    assert(item != null);
    return item(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result header(Header value),
    Result item(Item value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (item != null) {
      return item(this);
    }
    return orElse();
  }
}

abstract class Item implements ItemType {
  const factory Item({Record record}) = _$Item;

  Record get record;
  $ItemCopyWith<Item> get copyWith;
}
