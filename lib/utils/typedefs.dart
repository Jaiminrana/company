import 'dart:async';

import 'package:company/model/api_response/APIResponse.dart';
import 'package:company/model/county_data/country_data_res_dm.dart';
import 'package:company/values/enumerations.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();
typedef DisposeProvider<T> = FutureOr<void> Function(T value);
