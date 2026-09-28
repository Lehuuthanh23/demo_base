import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  static const Color background = Color(0xFFF7F2EE);
  static const Color card = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF121212);

  // Dark mode
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkCard = Color(0xFF1A1A1A);
  static const Color darkTitle = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF2A2A2A);
  static const Color bgTagDark = Color(0xFF2A2A2A);
  static const Color textOnTagDark = Color(0xFF999999);
  static const Color bgNavDark = Color(0xFF141414);
  static const Color bgNavActive = Color(0xFF252525);
  static const Color bgNavInActive = Color(0xFF9E9E9E);
  static const Color naviBlue500Dark = Color(0xFF6386DF);
  static const Color bgSurfaceIcon = Color(0xFF2A2A2A);
  static const Color bgSurface = Color(0xFF1E1E1E);
  static const Color colorIconDark = Color(0xFF9E9E9E);

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color pageBackground(BuildContext context) =>
      isDark(context) ? darkBackground : backgroundLight;

  static Color cardBackground(BuildContext context) =>
      isDark(context) ? darkCard : card;

  static Color pageTitle(BuildContext context) =>
      isDark(context) ? darkTitle : neutral1;

  static Color textOnCard(BuildContext context) =>
      isDark(context) ? darkTitle : neutral1;
  static const Color textSecondary = Color(0xFF8A7A6E);
  static const Color textMuted = Color(0xFFB0A49A);
  static const Color border = Color(0xFFECECEC);
  static const Color success = Color(0xFF1FAF5B);
  static const Color successSoft = Color(0xFFECFFEC);
  static const Color danger = Color(0xFFE25555);
  static const Color dangerSoft = Color(0xFFFDECEC);
  static const Color accentBrown = Color(0xFF6B3F2A);
  static const Color chipGold = Color(0xFFF3E2B8);
  static const Color chartGold = Color(0xFFC9A227);
  static const Color chartSilver = Color(0xFFB8B8B8);
  static const Color chartOther = Color(0xFF5B8DEF);

  static const Color neutral1 = Color(0xFF3B3B3B);
  static const Color neutral4 = Color(0xFF787878);
  static const Color neutral5 = Color(0xFF8C8C8C);
  static const Color neutral6 = Color(0xFFA1A1A1);
  static const Color neutral7 = Color(0xFFB5B5B5);
  static const Color neutral8 = Color(0xFFCACACA);
  static const Color neutral9 = Color(0xFFDEDEDE);
  static const Color neutral10 = Color(0xFFF2F2F2);
  static const Color orange = Color(0xFFF59C00);
  static const Color statusTang = Color(0xFF05AD21);
  static const Color statusGiam = Color(0xFFCB3C31);
  static const Color red5 = Color(0xFFDB3E42);
  static const Color red10 = Color(0xFFFFEEEF);
  static const Color green = Color(0xFF1CB11C);

  // Rose gold palette
  static const Color roseGold50 = Color(0xFFF0E9E7);
  static const Color roseGold100 = Color(0xFFD0BBB6);
  static const Color roseGold200 = Color(0xFFB99A92);
  static const Color roseGold300 = Color(0xFF986C60);
  static const Color roseGold400 = Color(0xFF854F41);
  static const Color roseGold500 = Color(0xFF662312);
  static const Color roseGold600 = Color(0xFF5D2010);
  static const Color roseGold700 = Color(0xFF48190D);
  static const Color roseGold800 = Color(0xFF38130A);
  static const Color roseGold900 = Color(0xFF2B0F08);

  static const Color goalBlue = Color(0xFF199FD6);
  static const Color goalRedPurple = Color(0xFF6C34BA);
  static const Color goalYellow = Color(0xFFEB8B3C);
  static const Color goalCyan = Color(0xFF07A987);
  static const Color goalRed = Color(0xFFE1686A);
  static const Color goalPink = Color(0xFFDE5EBC);
  static const Color goalBluerPurple = Color(0xFF6682FF);

  // Navi Blue
  static const Color naviBlue50 = Color(0xFFE8EDF7);
  static const Color naviBlue100 = Color(0xFFC5D1ED);
  static const Color naviBlue200 = Color(0xFF91A9E3);
  static const Color naviBlue300 = Color(0xFF5D82DA);
  static const Color naviBlue400 = Color(0xFF265BD9);
  static const Color naviBlue500 = Color(0xFF1A46AF);
  static const Color naviBlue600 = Color(0xFF163B93);
  static const Color naviBlue700 = Color(0xFF142F71);
  static const Color naviBlue800 = Color(0xFF112555);
  static const Color naviBlue900 = Color(0xFF0D1A3A);
  static const Color naviBlue1 = naviBlue500;
  static const Color splashNavy = Color(0xFF04295D);
  static const Color linkBlue = naviBlue500;
  static const Color linkBlueDark = naviBlue500Dark;
  static const Color inputFill = Color(0xFFF5F7F9);
  static Color backgroundBlur = Color(0xFFFFFFFF).withOpacity(0.55);
  static const Color backgroundLight = Color(0xFFF0F0F0);

  static const secondNaviBlue1Base = Color(0xFF17304D);
  static const naviBlue500Base = Color(0xFF17304D);

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE4C479), Color(0xFF906700)],
  );

  static const LinearGradient goldCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF0D78C), Color(0xFFC9A227), Color(0xFF9A7200)],
  );

  static const LinearGradient goldLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE4C479), Color(0xFFCB9409)],
  );

  static const LinearGradient silverLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE8EAED), Color(0xFF848587)],
  );

  static const LinearGradient otherLinearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFB8D5F5), Color(0xFF0D529C)],
  );

  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFCCD0), Color(0xFF972306)],
  );

  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFFFF), Color(0xFFC2C2C2)],
  );
  static const LinearGradient lightRedGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [Color(0xFFCBAFA8), Color(0xFFFFFFFF)],
  );

  static const LinearGradient navyBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF011B4C), Color(0xFF175996)],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFBE4D), Color(0xFFE86A24)],
  );
}
