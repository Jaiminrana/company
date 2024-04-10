
import 'package:company/helper/data_base_helper.dart';
import 'package:flutter/material.dart';
import 'package:company/apibase/repository.dart';
import 'package:company/app.dart';
import 'package:company/utils/helper.dart';

class AppConfig extends StatefulWidget {
  const AppConfig({super.key});

  @override
  State<AppConfig> createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  @override
  void initState() {
    setAppOrientation();
    Repository.instance.initialise();
    DataBaseHelper.instance.initDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const YukIdeaApp();
  }
}
