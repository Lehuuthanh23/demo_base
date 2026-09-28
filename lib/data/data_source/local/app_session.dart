final class AppSession {
  // Singleton
  static final AppSession _singleton = AppSession._internal();

  factory AppSession() {
    return _singleton;
  }

  AppSession._internal();

  // Properties
  String _currentLanguage = 'en';
  // String? _imgEncToken;

  String get currentLanguage => _currentLanguage;
  // String? get imgEncToken => _imgEncToken;

  // Methods
  void setLanguage(String language) => _currentLanguage = language;

  // void setImgEncToken(String? imgEncToken) {
  //   _imgEncToken = imgEncToken;
  // }
}
