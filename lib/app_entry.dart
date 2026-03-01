import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mizan/core/router/app_router.dart';
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

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('hello'.tr()),
//         backgroundColor: context.colorScheme.secondary,
//       ),
//       body: Column(
//         children: [
//           TextButton(
//             onPressed: () {
//               context.read<ThemeCubit>().updateTheme(ThemeMode.light);
//             },
//             child: const Text('Light'),
//           ),
//           TextButton(
//             onPressed: () {
//               context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
//             },
//             child: const Text('Dark'),
//           ),
//           TextButton(
//             onPressed: () {
//               context.read<ThemeCubit>().updateTheme(ThemeMode.system);
//             },
//             child: const Text('System'),
//           ),
//           TextButton(
//             onPressed: () {
//               LanguageManager.changeAppLang(context, lang: LanguageType.arabic);
//             },
//             child: const Text('Arabic'),
//           ),
//           TextButton(
//             onPressed: () {
//               LanguageManager.changeAppLang(
//                 context,
//                 lang: LanguageType.english,
//               );
//             },
//             child: const Text('English'),
//           ),
//         ],
//       ),
//     );
//   }
// }
