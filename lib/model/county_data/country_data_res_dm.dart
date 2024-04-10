import 'package:json_annotation/json_annotation.dart';

part 'country_data_res_dm.g.dart';

@JsonSerializable()
class CountryDataResDm {
  CountryDataResDm({
    this.name,
    this.currency,
    this.dialCode,
    this.flag,
    this.id,
  });

  final int? id;
  final String? name;
  final String? currency;
  final String? flag;
  final String? dialCode;

  factory CountryDataResDm.fromJson(Map<String, dynamic> json) =>
      _$CountryDataResDmFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataResDmToJson(this);
}
