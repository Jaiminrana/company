import 'package:company/apibase/repository.dart';
import 'package:company/generated/l10n.dart';
import 'package:company/helper/data_base_helper.dart';
import 'package:company/model/county_data/country_data_res_dm.dart';
import 'package:company/services/SnackbarService.dart';
import 'package:company/values/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  void initialize() {
    getCountryListData();
    searchController.addListener(onChanged);
  }

  final TextEditingController searchController = TextEditingController();

  @observable
  NetworkState countryState = NetworkState.idle;

  ObservableList<CountryDataResDm> countryList = ObservableList.of([]);

  @observable
  String? search;

  @computed
  bool get isSearchEmpty => search?.trim().isEmpty ?? true;

  @computed
  bool get isSearchResultEmpty =>
      searchCountry.isEmpty && countryList.isNotEmpty;

  void onChanged() => search = searchController.text.trim().toLowerCase();

  @computed
  List<CountryDataResDm> get searchCountry {
    return isSearchEmpty
        ? countryList
        : countryList.where(
            (country) {
              final name =
                  country.name?.toLowerCase().contains(search!) ?? false;
              final code = country.dialCode?.contains(search!) ?? false;
              if (code != false) {
                return code;
              }
              return name;
            },
          ).toList();
  }

  Future<void> getCountryListData() async {
    DataBaseHelper.instance.deleteAllCountry();
    countryList.clear();
    try {
      countryState = NetworkState.loading;
      final result = await Repository.instance.getCountryData();
      final countryData = result;
      if (countryData.isEmpty) {
        throw Exception();
      }

      for (var country in countryData) {
        await DataBaseHelper.instance.insert(country);
      }

      final data = await DataBaseHelper.instance.getAllCountry();
      data.sort((a, b) {
        int name = a.name?.compareTo(b.name!) ?? 0;
        if (name == 0) {
          return a.currency?.compareTo(b.currency!) ?? 0;
        }
        return name;
      });

      countryList.addAll(data);

      countryState = NetworkState.success;
    } catch (e) {
      countryState = NetworkState.error;
      debugPrint(e.toString());
      SnackBarService.showSnack(Str.current.somethingWentWrong);
    }
  }
}
