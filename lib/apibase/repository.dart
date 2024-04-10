import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:company/apibase/apiservice.dart';
import 'package:company/apibase/header_intercepter.dart';
import 'package:company/apibase/tuple.dart';
import 'package:company/generated/l10n.dart';
import 'package:company/model/api_response/APIResponse.dart';
import 'package:company/model/county_data/country_data_res_dm.dart';

import 'package:company/utils/exception.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/utils/network_utils.dart';
import 'package:company/utils/typedefs.dart';
import 'package:company/values/app_constant.dart';

class Repository {
  Repository._();

  late ApiService _apiService;

  final logInterceptor = LogInterceptor(
    requestBody: !kReleaseMode,
    responseBody: !kReleaseMode,
    request: !kReleaseMode,
    requestHeader: !kReleaseMode,
    responseHeader: !kReleaseMode,
  );

  static final Repository instance = Repository._();

  void initialise() {
    final dio = Dio();

    dio.interceptors.add(
      HeaderInterceptor(),
    );

    _apiService = ApiService(
      dio: dio,
      baseUrl: AppConstant.baseUrl,
    );
  }

  Future<List<CountryDataResDm>> getCountryData() async {
    final response = await _apiCall(
      request: () => _apiService.getCountryData(),
    );
    return response.data!;
  }

  Future<APITuple<T>> _apiCall<T>({
    required ApiCallback<T> request,
    bool getOnlyMessage = false,
    bool getIfNull = false,
  }) async {
    final internet = await NetworkUtils.instance.checkHasInternet();
    if (!internet) {
      throw JRException(Str.current.noInternetConnection);
    }
    try {
      final response = await request();
      if (getOnlyMessage) {
        /// Will return message on 200 Code if [getMessage] is true
        return APITuple(
          data: null,
          message: response.message ?? 'Success',
        );
      } else if (getIfNull || response.data != null) {
        /// Will return actual data
        return APITuple(
          data: response.data,
          message: response.message,
        );
      } else {
        throw JRException(Str.current.noDataFound);
      }
    } on String {
      rethrow;
    } on DioException catch (error) {
      if (error.response == null) {
        if (error.type == DioExceptionType.unknown) {
          throw JRException(Str.current.noInternetConnection);
        } else {
          throw JRException(Str.current.somethingWentWrong);
        }
      }
      if (error.response!.data is Map<String, dynamic>) {
        final response = APIResponse(
          status: error.response?.data['status'],
          data: error.response?.data['data'],
          message: error.response?.data['message'],
        );

        switch (error.response?.statusCode) {
          case 500:
          case 503:
          case 504:
          case 403:
          case 422:
          case 404:
          case 405:
          default:
            throw JRException(
              response.message.toString(),
              data: response.data.toString(),
              status: response.status,
              statusCode: error.response?.statusCode.toString(),
            );
        }
      } else {
        final statusCode = error.response?.statusCode;
        final statusMessage = error.response?.statusMessage;
        final msg = statusCode.toString().isNullOrEmpty &&
                statusMessage.toString().isNotNullOrEmpty
            ? kDebugMode
                ? '$statusCode $statusMessage'
                : statusMessage
            : null;
        throw JRException(
          msg ?? Str.current.invalidResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
