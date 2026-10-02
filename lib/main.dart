import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/apps/app_cubit.dart';
import 'package:vbindex/data/services/auth_session_notifier.dart';
import 'package:vbindex/di.dart';
import 'package:vbindex/presentations/routes.dart';

import 'constants/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
  try {
    await DependencyInjection.init();
    AppNavigator.init();
    AuthSessionNotifier.onSessionExpired = () => AppNavigator.go(Routes.sample);
  } catch (e, st) {
    debugPrint('App bootstrap failed: $e\n$st');
    rethrow;
  }
  runApp(
    BlocProvider<AppCubit>(
      create: (_) => AppCubit()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.locale != current.locale ||
          previous.themeMode != current.themeMode,
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) {
            return MaterialApp.router(
              color: AppColor.backgroundLight,
              title: Environments.getAppName(),
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: AppColor.backgroundLight,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFFFFE4DC),
                ),
                fontFamily: 'GoogleSansFlex',
                useMaterial3: true,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AppColor.isDark(context)
                      ? AppColor.naviBlue500Dark
                      : AppColor.naviBlue500,
                  selectionColor: AppColor.naviBlue100,
                  selectionHandleColor: AppColor.isDark(context)
                      ? AppColor.naviBlue500Dark
                      : AppColor.naviBlue500,
                ),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: AppColor.darkBackground,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color(0xFFFFE4DC),
                  brightness: Brightness.dark,
                  surface: AppColor.darkCard,
                  onSurface: AppColor.darkTitle,
                ),
                fontFamily: 'GoogleSansFlex',
                useMaterial3: true,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AppColor.isDark(context)
                      ? AppColor.naviBlue500Dark
                      : AppColor.naviBlue500,
                  selectionColor: AppColor.naviBlue100,
                  selectionHandleColor: AppColor.isDark(context)
                      ? AppColor.naviBlue500Dark
                      : AppColor.naviBlue500,
                ),
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale ?? const Locale('en'),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.noScaling,
                  ),
                  child: child ?? const SizedBox.shrink(),
                );
              },
              routerConfig: AppNavigator.router,
            );
          },
        );
      },
    );
  }
}
