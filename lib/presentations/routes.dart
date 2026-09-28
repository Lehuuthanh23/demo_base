import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vbindex/presentations/modules/sample/sample_screen.dart';
import 'package:vbindex/presentations/navigation/page_transition.dart';

enum Routes {
  sample('/');

  const Routes(this.path);
  final String path;
}

final class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static late final GoRouter router;

  static void init() {
    router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: Routes.sample.path,
      routes: [
        GoRoute(
          path: Routes.sample.path,
          pageBuilder: (context, state) =>
              getPage(page: const SampleScreen(), state: state),
        ),
      ],
    );
  }

  static void go(Routes route, {Object? extra}) {
    router.go(route.path, extra: extra);
  }

  static Future<T?> push<T extends Object?>(Routes route, {Object? extra}) {
    return router.push<T>(route.path, extra: extra);
  }

  static void pop<T extends Object?>([T? result]) {
    if (router.canPop()) {
      router.pop(result);
    }
  }
}
