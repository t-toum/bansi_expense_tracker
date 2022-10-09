import 'package:bansi_expense_tracker/core/utils/DI/sevice_locator.config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../app_navigator.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize dependencies
  AppNavigator();
  //Localization
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await $initGetIt(getIt);
}
