part of 'app_cubit.dart';

class AppState extends CoreState {
  final Locale? locale;
  final AppRole role;
  final ThemeMode themeMode;

  const AppState({
    this.locale,
    this.role = AppRole.customer,
    this.themeMode = ThemeMode.light,
  });

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [
        locale,
        role,
        themeMode,
      ];

  AppState copyWith({
    Locale? locale,
    AppRole? role,
    ThemeMode? themeMode,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      role: role ?? this.role,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

final class AppInitial extends AppState {
  const AppInitial({super.themeMode});
}
