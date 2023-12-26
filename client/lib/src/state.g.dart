// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GraphiteStateImpl _$$GraphiteStateImplFromJson(Map<String, dynamic> json) =>
    _$GraphiteStateImpl(
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
      assignments: (json['assignments'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Assignment.fromJson(e as Map<String, dynamic>)),
      ),
      catalogs: (json['catalogs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Catalog.fromJson(e as Map<String, dynamic>)),
      ),
      courses: (json['courses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Course.fromJson(e as Map<String, dynamic>)),
      ),
      instructors: (json['instructors'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Instructor.fromJson(e as Map<String, dynamic>)),
      ),
      users: (json['users'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, User.fromJson(e as Map<String, dynamic>)),
      ),
      roles: (json['roles'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Role.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$GraphiteStateImplToJson(_$GraphiteStateImpl instance) =>
    <String, dynamic>{
      'session': instance.session.toJson(),
      'assignments':
          instance.assignments.map((k, e) => MapEntry(k, e.toJson())),
      'catalogs': instance.catalogs.map((k, e) => MapEntry(k, e.toJson())),
      'courses': instance.courses.map((k, e) => MapEntry(k, e.toJson())),
      'instructors':
          instance.instructors.map((k, e) => MapEntry(k, e.toJson())),
      'users': instance.users.map((k, e) => MapEntry(k, e.toJson())),
      'roles': instance.roles.map((k, e) => MapEntry(k, e.toJson())),
    };
