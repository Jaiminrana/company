// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data_res_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDataResDm _$CountryDataResDmFromJson(Map<String, dynamic> json) =>
    CountryDataResDm(
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      dialCode: json['dialCode'] as String?,
      flag: json['flag'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CountryDataResDmToJson(CountryDataResDm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'flag': instance.flag,
      'dialCode': instance.dialCode,
    };
