import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/core/router/app_router.dart';
import 'core/helpers/extenstions.dart';
import 'core/theme/lang_manager.dart';
import 'core/theme/theme_manager.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeAnimationCurve: Curves.fastOutSlowIn,
            themeAnimationDuration: const Duration(milliseconds: 500),
            theme: AppThemes.lightAppTheme(),
            darkTheme: AppThemes.darkAppTheme(),
            themeMode: state,
            routerConfig: AppRouter().router,
          );
        },
      ),
    );
  }
}
