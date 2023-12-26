// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorImpl _$$InstructorImplFromJson(Map<String, dynamic> json) =>
    _$InstructorImpl(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      courses:
          (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$InstructorImplToJson(_$InstructorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'courses': instance.courses,
    };
