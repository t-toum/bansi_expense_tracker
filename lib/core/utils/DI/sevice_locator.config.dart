// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../network/network_call.dart' as _i7;
import '../../network/network_info.dart' as _i6;
import 'register_modules.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.factory<_i3.Dio>(() => injectionModule.dio);
  gh.factory<_i4.InternetConnectionChecker>(
      () => injectionModule.internetConnectionChecker);
  gh.factory<_i5.Logger>(() => injectionModule.logger);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.singleton<_i7.RestClient>(_i7.RestClient(get<_i3.Dio>()));
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => injectionModule.prefs,
    preResolve: true,
  );
  return get;
}

class _$InjectionModule extends _i9.InjectionModule {}
