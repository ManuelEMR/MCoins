// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'create_record_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$_ModeTearOff {
  const _$_ModeTearOff();

  Create create() {
    return const Create();
  }

  Edit edit([RecordWithCategory recordWithCategory]) {
    return Edit(
      recordWithCategory,
    );
  }
}

// ignore: unused_element
const _$Mode = _$_ModeTearOff();

mixin _$_Mode {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result create(),
    @required Result edit(RecordWithCategory recordWithCategory),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result create(),
    Result edit(RecordWithCategory recordWithCategory),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result create(Create value),
    @required Result edit(Edit value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result create(Create value),
    Result edit(Edit value),
    @required Result orElse(),
  });
}

abstract class _$ModeCopyWith<$Res> {
  factory _$ModeCopyWith(_Mode value, $Res Function(_Mode) then) =
      __$ModeCopyWithImpl<$Res>;
}

class __$ModeCopyWithImpl<$Res> implements _$ModeCopyWith<$Res> {
  __$ModeCopyWithImpl(this._value, this._then);

  final _Mode _value;
  // ignore: unused_field
  final $Res Function(_Mode) _then;
}

abstract class $CreateCopyWith<$Res> {
  factory $CreateCopyWith(Create value, $Res Function(Create) then) =
      _$CreateCopyWithImpl<$Res>;
}

class _$CreateCopyWithImpl<$Res> extends __$ModeCopyWithImpl<$Res>
    implements $CreateCopyWith<$Res> {
  _$CreateCopyWithImpl(Create _value, $Res Function(Create) _then)
      : super(_value, (v) => _then(v as Create));

  @override
  Create get _value => super._value as Create;
}

class _$Create with DiagnosticableTreeMixin implements Create {
  const _$Create();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_Mode.create()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', '_Mode.create'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Create);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result create(),
    @required Result edit(RecordWithCategory recordWithCategory),
  }) {
    assert(create != null);
    assert(edit != null);
    return create();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result create(),
    Result edit(RecordWithCategory recordWithCategory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result create(Create value),
    @required Result edit(Edit value),
  }) {
    assert(create != null);
    assert(edit != null);
    return create(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result create(Create value),
    Result edit(Edit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class Create implements _Mode {
  const factory Create() = _$Create;
}

abstract class $EditCopyWith<$Res> {
  factory $EditCopyWith(Edit value, $Res Function(Edit) then) =
      _$EditCopyWithImpl<$Res>;
  $Res call({RecordWithCategory recordWithCategory});
}

class _$EditCopyWithImpl<$Res> extends __$ModeCopyWithImpl<$Res>
    implements $EditCopyWith<$Res> {
  _$EditCopyWithImpl(Edit _value, $Res Function(Edit) _then)
      : super(_value, (v) => _then(v as Edit));

  @override
  Edit get _value => super._value as Edit;

  @override
  $Res call({
    Object recordWithCategory = freezed,
  }) {
    return _then(Edit(
      recordWithCategory == freezed
          ? _value.recordWithCategory
          : recordWithCategory as RecordWithCategory,
    ));
  }
}

class _$Edit with DiagnosticableTreeMixin implements Edit {
  const _$Edit([this.recordWithCategory]);

  @override
  final RecordWithCategory recordWithCategory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '_Mode.edit(recordWithCategory: $recordWithCategory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', '_Mode.edit'))
      ..add(DiagnosticsProperty('recordWithCategory', recordWithCategory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Edit &&
            (identical(other.recordWithCategory, recordWithCategory) ||
                const DeepCollectionEquality()
                    .equals(other.recordWithCategory, recordWithCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recordWithCategory);

  @override
  $EditCopyWith<Edit> get copyWith =>
      _$EditCopyWithImpl<Edit>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result create(),
    @required Result edit(RecordWithCategory recordWithCategory),
  }) {
    assert(create != null);
    assert(edit != null);
    return edit(recordWithCategory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result create(),
    Result edit(RecordWithCategory recordWithCategory),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (edit != null) {
      return edit(recordWithCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result create(Create value),
    @required Result edit(Edit value),
  }) {
    assert(create != null);
    assert(edit != null);
    return edit(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result create(Create value),
    Result edit(Edit value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class Edit implements _Mode {
  const factory Edit([RecordWithCategory recordWithCategory]) = _$Edit;

  RecordWithCategory get recordWithCategory;
  $EditCopyWith<Edit> get copyWith;
}
