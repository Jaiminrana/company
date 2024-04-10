// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'APIResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponse<T> _$APIResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    APIResponse<T>(
      message: json['msg'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      status: json['error'] as bool? ?? false,
    );

Map<String, dynamic> _$APIResponseToJson<T>(
  APIResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.status,
      'msg': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
