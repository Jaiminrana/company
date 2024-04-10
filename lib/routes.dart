import 'package:company/model/county_data/country_data_res_dm.dart';
import 'package:company/modules/home/store/home_store.dart';
import 'package:company/modules/home/view/flag_screen.dart';
import 'package:company/modules/home/view/home_screen.dart';
import 'package:company/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:company/utils/common%20widgets/invalid_route.dart';
import 'package:company/values/app_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.flagScreen:
        final countryData = settings.arguments as CountryDataResDm?;
        return getRoute(
          widget: countryData == null
              ? const InvalidRoute()
              : FlagScreen(
                  country: countryData,
                ),
        );

      /// An invalid route. User shouldn't see this, it's for debugging purpose
      /// only.
      default:
        return getRoute(widget: const InvalidRoute());
    }
  }
}
