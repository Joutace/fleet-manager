import 'package:fleet_manager/modules/login/login_page.dart';
import 'package:fleet_manager/modules/scanner/scanner_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router_flow/go_router_flow.dart';

import 'app_routes.dart';

CustomTransitionPage leftToRightTransition(GoRouterState state, Widget widget) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: widget,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

CustomTransitionPage bottomToTopTransition(GoRouterState state, Widget widget) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: widget,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,
  routes: <RouteBase>[
    GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const LoginPage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              ),
            )),
    GoRoute(
      path: AppRoutes.scan,
      pageBuilder: (_, state) =>
          leftToRightTransition(state, const ScannerPage()),
    ),
  ],
);
