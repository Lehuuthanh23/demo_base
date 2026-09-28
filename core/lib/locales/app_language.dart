part of '../core.dart';

class AppLanguage {
  final int? id;
  final String? name;
  final String? languageCode;
  final Locale? locale;
  final String? flag;
  final String? nativeName;

  AppLanguage({
    this.id,
    this.name,
    this.languageCode,
    this.locale,
    this.flag,
    this.nativeName,
  });

  static List<AppLanguage> languageList() {
    final supportedCodes =
        AppLocalizations.supportedLocales.map((locale) => locale.languageCode).toSet();

    return LanguageType.all
        .where((language) => supportedCodes.contains(language.languageCode))
        .toList();
  }

  static AppLanguage getLanguageByCode(String languageCode) {
    return languageList().firstWhere((element) => element.languageCode == languageCode);
  }

  static void changeLanguage(BuildContext context, String languageCode) {}

  String title(AppLocalizations tr) {
    switch (languageCode) {
      case 'vi':
        return tr.languageVietnamese;
      case 'en':
        return tr.languageEnglish;
      default:
        return name ?? languageCode?.toUpperCase() ?? '';
    }
  }

  String subtitle(AppLocalizations tr) {
    switch (languageCode) {
      case 'vi':
        return tr.languageVietnameseNative;
      case 'en':
        return tr.languageEnglishNative;
      default:
        return nativeName ?? '';
    }
  }
}

class LanguageType {
  static AppLanguage vietnamese = AppLanguage(
    id: 0,
    name: 'VN',
    languageCode: 'vi',
    locale: const Locale('vi'),
    flag: '🇻🇳',
    nativeName: 'Tiếng Việt',
  );
  static AppLanguage english = AppLanguage(
    id: 1,
    name: 'ENG',
    languageCode: 'en',
    locale: const Locale('en'),
    flag: '🇺🇸',
    nativeName: 'English',
  );

  static List<AppLanguage> all = [
    vietnamese,
    english,
  ];

  static List<AppLanguage> list(Locale? locale) {
    List<AppLanguage> langList = [];
    for (int i = 0; i < all.length; i++) {
      if (locale != null) {
        if (all[i].locale?.languageCode != locale.languageCode) {
          langList = [...langList, all[i]];
        }
      } else {
        langList = [...langList, all[i]];
      }
    }
    return langList;
  }

  static AppLanguage lang(Locale locale) {
    for (int i = 0; i < all.length; i++) {
      if (all[i].locale?.languageCode == locale.languageCode) {
        return all[i];
      }
    }
    return all[0];
  }
}
