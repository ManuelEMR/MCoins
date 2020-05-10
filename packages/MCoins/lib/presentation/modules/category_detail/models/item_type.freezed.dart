// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'item_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ItemTypeTearOff {
  const _$ItemTypeTearOff();

  Header header() {
    return const Header();
  }

  Item item({RecordWithCategory recordWithCategory}) {
    return Item(
      recordWithCategory: recordWithCategory,
    );
  }
}

// ignore: unused_element
const $ItemType = _$ItemTypeTearOff();

mixin _$ItemType {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(),
    @required Result item(RecordWithCategory recordWithCategory),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(),
    Result item(RecordWithCategory recordWithCategory),
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
}

class _$HeaderCopyWithImpl<$Res> extends _$ItemTypeCopyWithImpl<$Res>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(Header _value, $Res Function(Header) _then)
      : super(_value, (v) => _then(v as Header));

  @override
  Header get _value => super._value as Header;
}

class _$Header implements Header {
  const _$Header();

  @override
  String toString() {
    return 'ItemType.header()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Header);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(),
    @required Result item(RecordWithCategory recordWithCategory),
  }) {
    assert(header != null);
    assert(item != null);
    return header();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(),
    Result item(RecordWithCategory recordWithCategory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (header != null) {
      return header();
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
  const factory Header() = _$Header;
}

abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call({RecordWithCategory recordWithCategory});
}

class _$ItemCopyWithImpl<$Res> extends _$ItemTypeCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(Item _value, $Res Function(Item) _then)
      : super(_value, (v) => _then(v as Item));

  @override
  Item get _value => super._value as Item;

  @override
  $Res call({
    Object recordWithCategory = freezed,
  }) {
    return _then(Item(
      recordWithCategory: recordWithCategory == freezed
          ? _value.recordWithCategory
          : recordWithCategory as RecordWithCategory,
    ));
  }
}

class _$Item implements Item {
  const _$Item({this.recordWithCategory});

  @override
  final RecordWithCategory recordWithCategory;

  @override
  String toString() {
    return 'ItemType.item(recordWithCategory: $recordWithCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Item &&
            (identical(other.recordWithCategory, recordWithCategory) ||
                const DeepCollectionEquality()
                    .equals(other.recordWithCategory, recordWithCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recordWithCategory);

  @override
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result header(),
    @required Result item(RecordWithCategory recordWithCategory),
  }) {
    assert(header != null);
    assert(item != null);
    return item(recordWithCategory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result header(),
    Result item(RecordWithCategory recordWithCategory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (item != null) {
      return item(recordWithCategory);
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
  const factory Item({RecordWithCategory recordWithCategory}) = _$Item;

  RecordWithCategory get recordWithCategory;
  $ItemCopyWith<Item> get copyWith;
}
