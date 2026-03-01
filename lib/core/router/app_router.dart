import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mizan/modules/auth/view/login_page.dart';

// app navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppRouter {
  // Singleton instance
  static AppRouter? _instance;

  // Private constructor
  AppRouter._() {
    _initializeRouter();
  }

  // Factory constructor to return the singleton instance
  factory AppRouter() {
    // If instance already exists, return it
    _instance ??= AppRouter._();
    return _instance!;
  }

  // Static getter to access the singleton instance directly
  static AppRouter get instance {
    if (_instance == null) {
      throw Exception('AppRouter not initialized. Call AppRouter() first.');
    }
    return _instance!;
  }

  // The GoRouter instance
  late final GoRouter router;

  // Initialize the router
  void _initializeRouter() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      observers: [routeObserver],
      onException: (context, state, goRouter) {
        log('🔗 ROUTER EXCEPTION: ${state.uri}');

        // For other unknown routes, go to bottom nav
        log('🔗 ROUTER EXCEPTION: Unknown route, going to bottom nav');
      },
      initialLocation: AppRoutes.login,
      routes: [
        ShellRoute(
          builder: (context, state, child) => child,
          // builder: (context, state, child) =>
          //     BlocProvider(create: (c) => AuthCubit(), child: child),
          routes: [
            GoRoute(
              path: AppRoutes.splash,
              builder: (context, state) => const SizedBox(),
            ),
            GoRoute(
              path: AppRoutes.login,
              builder: (context, state) => const LoginPage(),
            ),

            GoRoute(
              path: AppRoutes.forceUpdate,
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }

  // static String? getCurrentLocation() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     getIt<RouteNotifier>().updateRoute(
  //       AppRouter.instance.router.state.name ?? 'Unknown',
  //     );
  //   });
  //   log('CURRENT LOCATION: ${AppRouter.instance.router.state.name}');
  //   return AppRouter.instance.router.state.name;
  // }
}

/// This route notifier for updating route location
/// and let listenable builders access it
class RouteNotifier extends ValueNotifier<String> {
  RouteNotifier(String value) : super(value);

  void updateRoute(String newRoute) {
    value = newRoute;
  }
}

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String forceUpdate = '/forceUpdate';
}
