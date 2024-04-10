import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:company/model/api_response/APIResponse.dart';
import 'package:company/model/county_data/country_data_res_dm.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({
    required Dio dio,
    required String baseUrl,
  }) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('countries/info?returns=currency%2Cflag%2CunicodeFlag%2CdialCode')
  Future<APIResponse<List<CountryDataResDm>>> getCountryData();
}
