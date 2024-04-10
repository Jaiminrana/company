import 'package:company/helper/data_base_helper.dart';

import 'package:company/modules/home/store/home_store.dart';
import 'package:company/services/SnackbarService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:company/generated/l10n.dart';
import 'package:company/resources/resources.dart';
import 'package:company/utils/common%20widgets/jr_opaque_divider.dart';
import 'package:company/utils/common%20widgets/jr_svg_picture.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/utils/common%20widgets/jr_scaffold.dart';
import 'package:company/values/app_colors.dart';
import 'package:company/values/app_constant.dart';
import 'package:company/values/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();
    return JrScaffold(
      title: Str.current.countryData,
      //onTitleTap: store.getCountryListData,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.whiteFontColor,
                ),
                controller: store.searchController,
                cursorColor: AppColors.orange,
                keyboardType: TextInputType.text,
                onTapOutside: (_) => context.unFocusField(),
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 11.5,
                    horizontal: 15,
                  ),
                  prefixIcon: const JRSvgPicture(
                    assetName: Vectors.search,
                    height: 16,
                    width: 16,
                    fit: BoxFit.none,
                  ),
                  hintText: Str.current.search,
                  hintStyle: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.whiteFontColor,
                  ),
                  fillColor: AppColors.slate,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      AppConstant.roundedBorder8,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.orange,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      AppConstant.roundedBorder8,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Observer(builder: (context) {
            return Expanded(
              child: store.countryState.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (store.isSearchResultEmpty || store.countryState.isFailed)
                      ? Text(
                          Str.current.oopsNoResultsFound,
                          style: context.textTheme.bodyMedium,
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          itemCount: store.searchCountry.length,
                          itemBuilder: (context, index) {
                            final country = store.searchCountry[index];
                            final isCountryValid =
                                country.flag.isNotNullOrEmpty &&
                                    country.name.isNotNullOrEmpty &&
                                    country.dialCode.isNotNullOrEmpty &&
                                    country.currency.isNotNullOrEmpty;
                            return isCountryValid
                                ? GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onLongPress: () => _onDeleteCountry(
                                      index: index,
                                      store: store,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.flagScreen,
                                        arguments: country,
                                      );
                                    },
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      leading: SizedBox(
                                        height: 22,
                                        width: 34,
                                        child: Hero(
                                          tag: country.flag.toString(),
                                          child: JRSvgPicture(
                                            isSvgNetwork: true,
                                            fit: BoxFit.cover,
                                            assetName: country.flag!,
                                          ),
                                        ),
                                      ),
                                      title: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              country.dialCode!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context
                                                  .textTheme.displayMedium
                                                  ?.copyWith(
                                                color: AppColors.whiteFontColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            child: Text(
                                              country.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context
                                                  .textTheme.displayMedium
                                                  ?.copyWith(
                                                color: AppColors.whiteFontColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Text(
                                        country.currency!,
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.whiteFontColor,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          },
                          separatorBuilder: (context, index) =>
                              const JrOpaqueDivider(),
                        ),
            );
          }),
        ],
      ),
    );
  }

  void _onDeleteCountry({
    required int index,
    required HomeStore store,
  }) async {
    final country = store.searchCountry[index];
    final result =
        await DataBaseHelper.instance.deleteCountry(country.id ?? -1);
    if (result != 0) {
      final deletedCountry = country;
      store.countryList.removeAt(index);
      SnackBarService.showSnack(
        Str.current.deleteCountry(deletedCountry.name!),
        color: AppColors.red,
      );
    }
  }
}
