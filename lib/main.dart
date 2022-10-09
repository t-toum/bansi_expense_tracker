import 'package:bansi_expense_tracker/core/utils/app_navigator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/utils/DI/sevice_locator.dart';
import 'core/utils/routes.dart';
import 'generated/locale_keys.g.dart';

void main() async {
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.kAppName.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.dashboardRoute,
    );
  }
}
