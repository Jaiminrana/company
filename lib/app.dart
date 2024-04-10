import 'package:company/modules/home/store/home_store.dart';
import 'package:company/modules/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:company/generated/l10n.dart';

import 'package:company/routes.dart';
import 'package:company/services/SnackbarService.dart';
import 'package:company/utils/extensions.dart';
import 'package:company/values/app_theme.dart';
import 'package:provider/provider.dart';

class YukIdeaApp extends StatelessWidget {
  const YukIdeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackBarService.key,
      theme: AppTheme.instance.getDarkTheme(),
      onGenerateRoute: Routes.generateRoute,
      localizationsDelegates: const [Str.delegate],
      home: Provider(
        create: (_) => HomeStore()..initialize(),
        child: const HomeScreen(),
      ),
    );
  }
}
