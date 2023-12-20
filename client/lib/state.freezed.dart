// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GraphiteState _$GraphiteStateFromJson(Map<String, dynamic> json) {
  return _GraphiteState.fromJson(json);
}

/// @nodoc
mixin _$GraphiteState {
  Session get session => throw _privateConstructorUsedError;
  Map<String, Assignment> get assignments => throw _privateConstructorUsedError;
  Map<String, Catalog> get catalogs => throw _privateConstructorUsedError;
  Map<String, Course> get courses => throw _privateConstructorUsedError;
  Map<String, Instructor> get instructors => throw _privateConstructorUsedError;
  Map<String, User> get users => throw _privateConstructorUsedError;
  Map<String, Role> get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GraphiteStateCopyWith<GraphiteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphiteStateCopyWith<$Res> {
  factory $GraphiteStateCopyWith(
          GraphiteState value, $Res Function(GraphiteState) then) =
      _$GraphiteStateCopyWithImpl<$Res, GraphiteState>;
  @useResult
  $Res call(
      {Session session,
      Map<String, Assignment> assignments,
      Map<String, Catalog> catalogs,
      Map<String, Course> courses,
      Map<String, Instructor> instructors,
      Map<String, User> users,
      Map<String, Role> roles});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$GraphiteStateCopyWithImpl<$Res, $Val extends GraphiteState>
    implements $GraphiteStateCopyWith<$Res> {
  _$GraphiteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? assignments = null,
    Object? catalogs = null,
    Object? courses = null,
    Object? instructors = null,
    Object? users = null,
    Object? roles = null,
  }) {
    return _then(_value.copyWith(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      assignments: null == assignments
          ? _value.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Assignment>,
      catalogs: null == catalogs
          ? _value.catalogs
          : catalogs // ignore: cast_nullable_to_non_nullable
              as Map<String, Catalog>,
      courses: null == courses
          ? _value.courses
          : courses // ignore: cast_nullable_to_non_nullable
              as Map<String, Course>,
      instructors: null == instructors
          ? _value.instructors
          : instructors // ignore: cast_nullable_to_non_nullable
              as Map<String, Instructor>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, User>,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as Map<String, Role>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GraphiteStateImplCopyWith<$Res>
    implements $GraphiteStateCopyWith<$Res> {
  factory _$$GraphiteStateImplCopyWith(
          _$GraphiteStateImpl value, $Res Function(_$GraphiteStateImpl) then) =
      __$$GraphiteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Session session,
      Map<String, Assignment> assignments,
      Map<String, Catalog> catalogs,
      Map<String, Course> courses,
      Map<String, Instructor> instructors,
      Map<String, User> users,
      Map<String, Role> roles});

  @override
  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$GraphiteStateImplCopyWithImpl<$Res>
    extends _$GraphiteStateCopyWithImpl<$Res, _$GraphiteStateImpl>
    implements _$$GraphiteStateImplCopyWith<$Res> {
  __$$GraphiteStateImplCopyWithImpl(
      _$GraphiteStateImpl _value, $Res Function(_$GraphiteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? assignments = null,
    Object? catalogs = null,
    Object? courses = null,
    Object? instructors = null,
    Object? users = null,
    Object? roles = null,
  }) {
    return _then(_$GraphiteStateImpl(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
      assignments: null == assignments
          ? _value._assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as Map<String, Assignment>,
      catalogs: null == catalogs
          ? _value._catalogs
          : catalogs // ignore: cast_nullable_to_non_nullable
              as Map<String, Catalog>,
      courses: null == courses
          ? _value._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as Map<String, Course>,
      instructors: null == instructors
          ? _value._instructors
          : instructors // ignore: cast_nullable_to_non_nullable
              as Map<String, Instructor>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, User>,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as Map<String, Role>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GraphiteStateImpl implements _GraphiteState {
  _$GraphiteStateImpl(
      {required this.session,
      required final Map<String, Assignment> assignments,
      required final Map<String, Catalog> catalogs,
      required final Map<String, Course> courses,
      required final Map<String, Instructor> instructors,
      required final Map<String, User> users,
      required final Map<String, Role> roles})
      : _assignments = assignments,
        _catalogs = catalogs,
        _courses = courses,
        _instructors = instructors,
        _users = users,
        _roles = roles;

  factory _$GraphiteStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GraphiteStateImplFromJson(json);

  @override
  final Session session;
  final Map<String, Assignment> _assignments;
  @override
  Map<String, Assignment> get assignments {
    if (_assignments is EqualUnmodifiableMapView) return _assignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_assignments);
  }

  final Map<String, Catalog> _catalogs;
  @override
  Map<String, Catalog> get catalogs {
    if (_catalogs is EqualUnmodifiableMapView) return _catalogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_catalogs);
  }

  final Map<String, Course> _courses;
  @override
  Map<String, Course> get courses {
    if (_courses is EqualUnmodifiableMapView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_courses);
  }

  final Map<String, Instructor> _instructors;
  @override
  Map<String, Instructor> get instructors {
    if (_instructors is EqualUnmodifiableMapView) return _instructors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_instructors);
  }

  final Map<String, User> _users;
  @override
  Map<String, User> get users {
    if (_users is EqualUnmodifiableMapView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_users);
  }

  final Map<String, Role> _roles;
  @override
  Map<String, Role> get roles {
    if (_roles is EqualUnmodifiableMapView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roles);
  }

  @override
  String toString() {
    return 'GraphiteState(session: $session, assignments: $assignments, catalogs: $catalogs, courses: $courses, instructors: $instructors, users: $users, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GraphiteStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            const DeepCollectionEquality()
                .equals(other._assignments, _assignments) &&
            const DeepCollectionEquality().equals(other._catalogs, _catalogs) &&
            const DeepCollectionEquality().equals(other._courses, _courses) &&
            const DeepCollectionEquality()
                .equals(other._instructors, _instructors) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      session,
      const DeepCollectionEquality().hash(_assignments),
      const DeepCollectionEquality().hash(_catalogs),
      const DeepCollectionEquality().hash(_courses),
      const DeepCollectionEquality().hash(_instructors),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GraphiteStateImplCopyWith<_$GraphiteStateImpl> get copyWith =>
      __$$GraphiteStateImplCopyWithImpl<_$GraphiteStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GraphiteStateImplToJson(
      this,
    );
  }
}

abstract class _GraphiteState implements GraphiteState {
  factory _GraphiteState(
      {required final Session session,
      required final Map<String, Assignment> assignments,
      required final Map<String, Catalog> catalogs,
      required final Map<String, Course> courses,
      required final Map<String, Instructor> instructors,
      required final Map<String, User> users,
      required final Map<String, Role> roles}) = _$GraphiteStateImpl;

  factory _GraphiteState.fromJson(Map<String, dynamic> json) =
      _$GraphiteStateImpl.fromJson;

  @override
  Session get session;
  @override
  Map<String, Assignment> get assignments;
  @override
  Map<String, Catalog> get catalogs;
  @override
  Map<String, Course> get courses;
  @override
  Map<String, Instructor> get instructors;
  @override
  Map<String, User> get users;
  @override
  Map<String, Role> get roles;
  @override
  @JsonKey(ignore: true)
  _$$GraphiteStateImplCopyWith<_$GraphiteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
