import 'package:bansi_expense_tracker/core/widgets/not_found_page.dart';
import 'package:bansi_expense_tracker/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:bansi_expense_tracker/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'DI/sevice_locator.dart';

class AppRoute {
  static const String dashboardRoute = "/";
  static const String detailRoute = "/detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return _materialRoute(
          const DashboardPage(),
          providers: [
            BlocProvider<DashboardCubit>(
              create: (context) => getIt<DashboardCubit>(),
            ),
          ],
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget screen,
      {List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: screen)
            : screen);
  }
}
