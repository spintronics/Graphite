// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Instructor _$InstructorFromJson(Map<String, dynamic> json) {
  return _Instructor.fromJson(json);
}

/// @nodoc
mixin _$Instructor {
  String? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<String>? get courses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructorCopyWith<Instructor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorCopyWith<$Res> {
  factory $InstructorCopyWith(
          Instructor value, $Res Function(Instructor) then) =
      _$InstructorCopyWithImpl<$Res, Instructor>;
  @useResult
  $Res call({String? id, User? user, List<String>? courses});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$InstructorCopyWithImpl<$Res, $Val extends Instructor>
    implements $InstructorCopyWith<$Res> {
  _$InstructorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? courses = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      courses: freezed == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InstructorImplCopyWith<$Res>
    implements $InstructorCopyWith<$Res> {
  factory _$$InstructorImplCopyWith(
          _$InstructorImpl value, $Res Function(_$InstructorImpl) then) =
      __$$InstructorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, User? user, List<String>? courses});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$InstructorImplCopyWithImpl<$Res>
    extends _$InstructorCopyWithImpl<$Res, _$InstructorImpl>
    implements _$$InstructorImplCopyWith<$Res> {
  __$$InstructorImplCopyWithImpl(
      _$InstructorImpl _value, $Res Function(_$InstructorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? courses = freezed,
  }) {
    return _then(_$InstructorImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      courses: freezed == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InstructorImpl implements _Instructor {
  _$InstructorImpl({this.id, this.user, final List<String>? courses})
      : _courses = courses;

  factory _$InstructorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorImplFromJson(json);

  @override
  final String? id;
  @override
  final User? user;
  final List<String>? _courses;
  @override
  List<String>? get courses {
    final value = _courses;
    if (value == null) return null;
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Instructor(id: $id, user: $user, courses: $courses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, user, const DeepCollectionEquality().hash(_courses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorImplCopyWith<_$InstructorImpl> get copyWith =>
      __$$InstructorImplCopyWithImpl<_$InstructorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorImplToJson(
      this,
    );
  }
}

abstract class _Instructor implements Instructor {
  factory _Instructor(
      {final String? id,
      final User? user,
      final List<String>? courses}) = _$InstructorImpl;

  factory _Instructor.fromJson(Map<String, dynamic> json) =
      _$InstructorImpl.fromJson;

  @override
  String? get id;
  @override
  User? get user;
  @override
  List<String>? get courses;
  @override
  @JsonKey(ignore: true)
  _$$InstructorImplCopyWith<_$InstructorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
