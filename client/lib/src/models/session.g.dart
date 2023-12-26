// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String?,
      name: json['name'] == null
          ? null
          : User.fromJson(json['name'] as Map<String, dynamic>),
      token: json['token'] as String?,
      expiration: json['expiration'] == null
          ? null
          : DateTime.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name?.toJson(),
      'token': instance.token,
      'expiration': instance.expiration?.toIso8601String(),
    };
