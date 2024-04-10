import 'dart:io';

import 'package:company/model/county_data/country_data_res_dm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static Database? _dataBase;

  static final instance = DataBaseHelper._();

  Future<Database> get database async {
    // If database exists, return database
    if (_dataBase != null) return _dataBase!;

    // If database don't exists, create one
    _dataBase = await initDataBase();

    return _dataBase!;
  }

  // Table attributes
  final String tableName = 'Country';
  final String idColumn = 'id';
  final String nameColumn = 'name';
  final String currencyColumn = 'currency';
  final String flagColumn = 'flag';
  final String dialCodeColumn = 'dialCode';

  //create DataBase for country data
  Future<Database> initDataBase() async {
    final documentDirectory = await getApplicationDocumentsDirectory();

    final path = "${documentDirectory.path}/country.db";

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  void _createDb(db, version) async {
    await db.execute('''CREATE TABLE $tableName(
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $nameColumn TEXT,
            $currencyColumn TEXT,
            $flagColumn TEXT,
            $dialCodeColumn TEXT
            )''');
  }

  // Insert employee on database
  Future<int> insert(CountryDataResDm countryDataResDm) async {
    //await deleteAllCountry();
    final db = await database;
    final res = await db.insert(tableName, countryDataResDm.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllCountry() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM $tableName');

    return res;
  }

  Future<List<CountryDataResDm>> getAllCountry() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM $tableName");

    List<CountryDataResDm> countryList = res.isNotEmpty
        ? res.map((country) => CountryDataResDm.fromJson(country)).toList()
        : [];

    return countryList;
  }

  Future<int> deleteCountry(int id) async {
    final db = await database;

    final result =
        await db.delete(tableName, where: '$idColumn = ?', whereArgs: [id]);

    return result;
  }
}
