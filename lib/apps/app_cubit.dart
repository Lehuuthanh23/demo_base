import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vbindex/apps/app_role.dart';

import '../data/data_source/local/app_session.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> with SuperAppConn {
  AppCubit() : super(AppInitial(themeMode: _storedThemeMode()));

  static ThemeMode _storedThemeMode() {
    final isDark = AppSP.get<bool>(AppSP.isDarkMode) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> getRole() async {
    final roleCode = AppSP.get<String>(AppSP.userRole);
    emit(state.copyWith(role: AppRole.fromCode(roleCode)));
  }

  void getTheme() {
    emit(state.copyWith(themeMode: _storedThemeMode()));
  }

  Future getLanguage() async {
    var languageLocal = await AppSP.get(AppSP.languageLocale);

    if (!Utils.isNullOrEmpty(languageLocal)) {
      // Nếu trong db có sẵn vi / en / km thì load
      emit(state.copyWith(locale: Locale(languageLocal)));
      onChangeLanguage(Locale(languageLocal));
    } else {
      // Mặc định tiếng Anh
      onChangeLanguage(LanguageType.english.locale);
    }
  }

  void init([BuildContext? context]) async {
    await getRole();
    await getLanguage();
    getTheme();
  }

  /// Change Language
  Future<void> onChangeLanguage(Locale? lang) async {
    if (lang == null) return;
    await AppSP.remove(AppSP.languageLocale);
    await AppSP.set(AppSP.languageLocale, lang.languageCode);
    AppSession().setLanguage(lang.languageCode);
    emit(state.copyWith(locale: lang));
  }

  Future<void> onChangeRole(AppRole role) async {
    await AppSP.remove(AppSP.userRole);
    await AppSP.set(AppSP.userRole, role.code);
    emit(state.copyWith(role: role));
  }

  Future<void> onChangeTheme(ThemeMode themeMode) async {
    await AppSP.set(AppSP.isDarkMode, themeMode == ThemeMode.dark);
    emit(state.copyWith(themeMode: themeMode));
  }

  @override
  onEvent(MiniAppEvent event, [data]) async {
    switch (event) {
      default:
    }
  }
}
