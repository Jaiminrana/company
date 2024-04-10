import 'package:company/generated/l10n.dart';
import 'package:company/model/county_data/country_data_res_dm.dart';

import 'package:company/utils/common%20widgets/jr_primary_button.dart';
import 'package:company/utils/common%20widgets/jr_scaffold.dart';
import 'package:company/utils/common%20widgets/jr_svg_picture.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class FlagScreen extends StatelessWidget {
  const FlagScreen({
    super.key,
    required this.country,
  });

  final CountryDataResDm country;

  @override
  Widget build(BuildContext context) {
    return JrScaffold(
      title: Str.current.flag,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Hero(
            tag: country.flag!,
            child: Center(
              child: JRSvgPicture(
                isSvgNetwork: true,
                fit: BoxFit.fitWidth,
                width: context.widthFraction(),
                height: 200,
                assetName: country.flag!,
              ),
            ),
          ),
          Text(
            sprintf(
              AppStrings.countryString,
              [
                country.name!,
                country.currency,
              ],
            ),
            style: context.textTheme.bodyLarge,
          ),
          JrPrimaryButton(
            title: Str.current.back,
            onTap: Navigator.of(context).pop,
          ),
        ],
      ),
    );
  }
}
