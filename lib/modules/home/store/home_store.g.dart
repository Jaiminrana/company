// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<bool>? _$isSearchEmptyComputed;

  @override
  bool get isSearchEmpty =>
      (_$isSearchEmptyComputed ??= Computed<bool>(() => super.isSearchEmpty,
              name: '_HomeStore.isSearchEmpty'))
          .value;
  Computed<bool>? _$isSearchResultEmptyComputed;

  @override
  bool get isSearchResultEmpty => (_$isSearchResultEmptyComputed ??=
          Computed<bool>(() => super.isSearchResultEmpty,
              name: '_HomeStore.isSearchResultEmpty'))
      .value;
  Computed<List<CountryDataResDm>>? _$searchCountryComputed;

  @override
  List<CountryDataResDm> get searchCountry => (_$searchCountryComputed ??=
          Computed<List<CountryDataResDm>>(() => super.searchCountry,
              name: '_HomeStore.searchCountry'))
      .value;

  late final _$countryStateAtom =
      Atom(name: '_HomeStore.countryState', context: context);

  @override
  NetworkState get countryState {
    _$countryStateAtom.reportRead();
    return super.countryState;
  }

  @override
  set countryState(NetworkState value) {
    _$countryStateAtom.reportWrite(value, super.countryState, () {
      super.countryState = value;
    });
  }

  late final _$searchAtom = Atom(name: '_HomeStore.search', context: context);

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  @override
  String toString() {
    return '''
countryState: ${countryState},
search: ${search},
isSearchEmpty: ${isSearchEmpty},
isSearchResultEmpty: ${isSearchResultEmpty},
searchCountry: ${searchCountry}
    ''';
  }
}
