import 'package:json_annotation/json_annotation.dart';

part 'APIResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse<T> {
  const APIResponse({
    this.message,
    this.data,
    this.status = false,
  });

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$APIResponseFromJson(json, fromJsonT);

  @JsonKey(name: 'error')
  final bool status;
  @JsonKey(name: 'msg')
  final String? message;
  final T? data;

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$APIResponseToJson(this, toJsonT);
}
