import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/modules/auth/view/login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppRouter {
  static AppRouter? _instance;

  AppRouter._() {
    _initializeRouter();
  }

  factory AppRouter() {
    _instance ??= AppRouter._();
    return _instance!;
  }

  static AppRouter get instance {
    if (_instance == null) {
      throw Exception('AppRouter not initialized. Call AppRouter() first.');
    }
    return _instance!;
  }

  late final GoRouter router;

  void _initializeRouter() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      observers: [routeObserver],
      onException: (context, state, goRouter) {
        log('🔗 ROUTER EXCEPTION: ${state.uri}');
      },
      initialLocation: AppRoutes.login,
      routes: [
        ShellRoute(
          builder: (context, state, child) => child,
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
}

class RouteNotifier extends ValueNotifier<String> {
  RouteNotifier(super.value);

  void updateRoute(String newRoute) {
    value = newRoute;
  }
}

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String forceUpdate = '/forceUpdate';
}
