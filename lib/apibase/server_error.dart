import 'package:dio/dio.dart';
import 'package:company/generated/l10n.dart';
import 'package:company/model/api_response/APIResponse.dart';
import 'package:company/utils/extensions.dart';

class ServerError implements Exception {
  ServerError.fromDioException({required DioException exception}) {
    _handleError(exception);
  }

  ServerError.fromException(Object error) {
    errorMessage = error.toString();
  }

  late final String? errorMessage;
  late final int? errorCode;

  void _handleError(DioException exception) {
    final response = exception.response;
    errorCode = response?.statusCode;

    final data = exception.response?.data;

    if (data != null && data is Map<String, dynamic>) {
      final response = APIResponse.fromJson(
        data,
        (json) {},
      );

      if (response.message.isNotNullOrEmpty) {
        errorMessage = response.message;
      } else if (response.status) {
        errorMessage = Str.current.oopsSomethingWentWrong;
      } else {
        errorMessage = exception.message ?? Str.current.somethingWentWrong;
      }
    }


  }
}
