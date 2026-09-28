part of '../core.dart';

class StringUtils {
  static String convertFloorBuildingToString(
      {required AppLocalizations lang, required String floor, required String buildingName}) {
    return '$floor${Utils.isNullOrEmpty(floor) ? '' : ' - '}$buildingName';
  }

  static String formatPriceWithLocale(int price, {String? localeCode}) {
    // Nếu không có localeCode, mặc định là 'en'
    final langCode = localeCode ?? 'en';

    print('🔍 formatPriceWithLocale: price=$price, localeCode=$localeCode, langCode=$langCode');

    // Nếu là tiếng Campuchia, dùng money2 để format sang KHR
    if (langCode == 'km') {
      try {
        // Lấy tỷ giá từ SharedPreferences, nếu không có thì dùng giá trị mặc định
        final exchangeRate = AppSP.get<double>(AppSP.exchangeRate) ?? 4008.50;
        final khrAmount = price * exchangeRate;
        print('💰 Converting to KHR: $price USD = $khrAmount KHR (rate: $exchangeRate)');

        // Sử dụng money2 để format KHR
        final khrCurrency = Currency.create('KHR', 0, symbol: '៛');
        // Thử cách 1: Dùng fromNum với currency
        try {
          final khr = Money.fromNum(khrAmount.toDouble(), isoCode: khrCurrency.isoCode);
          final formatted = khr.format('S###,###');
          print('✅ Formatted KHR (method 1): $formatted');
          return formatted;
        } catch (e1) {
          print('⚠️ Method 1 failed: $e1, trying method 2...');
          // Thử cách 2: Dùng fromInt
          try {
            final khrInt = khrAmount.toInt();
            final khr = Money.fromInt(khrInt, isoCode: khrCurrency.isoCode);
            final formatted = khr.format('S###,###');
            print('✅ Formatted KHR (method 2): $formatted');
            return formatted;
          } catch (e2) {
            print('⚠️ Method 2 failed: $e2, using simple format...');
            // Fallback: Format đơn giản với NumberFormat
            final formatter = NumberFormat('#,##0', 'en_US');
            return '៛${formatter.format(khrAmount.toInt())}';
          }
        }
      } catch (e) {
        print('❌ Error formatting KHR: $e');
        // Fallback về USD nếu có lỗi
        final formatter = NumberFormat.currency(
          locale: 'en_US',
          symbol: '\$',
          decimalDigits: 0,
        );
        return formatter.format(price);
      }
    }

    // Mặc định format USD cho tiếng Anh và tiếng Việt
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 0,
    );
    return formatter.format(price);
  }

  /// Format tiền dựa trên locale hiện tại (async version)
  /// - 'km' (Campuchia): Dùng money2 để format sang KHR (Riel)
  /// - 'en' hoặc 'vi' hoặc mặc định: Format USD
  static Future<String> formatPriceWithLocaleAsync(int price) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString('languageLocale') ?? 'en'; // Mặc định là 'en'
      return formatPriceWithLocale(price, localeCode: langCode);
    } catch (e) {
      // Fallback về USD nếu có lỗi
      return formatPriceWithLocale(price, localeCode: 'en');
    }
  }

  /// Format tiền double dựa trên locale hiện tại (async version)
  /// - 'km' (Campuchia): Dùng money2 để format sang KHR (Riel)
  /// - 'en' hoặc 'vi' hoặc mặc định: Format USD
  static Future<String> formatPriceDoubleWithLocaleAsync(double price) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final langCode = prefs.getString('languageLocale') ?? 'en'; // Mặc định là 'en'
      return formatPriceDoubleWithLocale(price, localeCode: langCode);
    } catch (e) {
      // Fallback về USD nếu có lỗi
      return formatPriceDoubleWithLocale(price, localeCode: 'en');
    }
  }

  /// Lấy locale code hiện tại từ SharedPreferences (synchronous)
  /// Trả về 'en' nếu không tìm thấy
  static String getCurrentLocaleCode() {
    try {
      // Sử dụng AppSP để lấy locale code
      final langCode = AppSP.get<String>(AppSP.languageLocale);
      if (langCode != null && langCode.isNotEmpty) {
        return langCode;
      }
      return 'en'; // Mặc định là tiếng Anh
    } catch (e) {
      return 'en'; // Fallback về tiếng Anh
    }
  }

  /// Format tiền (int) - wrapper cho formatPriceWithLocale với locale hiện tại
  /// Tương thích với code cũ
  static String formatPrice(int price) {
    return formatPriceWithLocale(price, localeCode: getCurrentLocaleCode());
  }

  /// Format tiền (synchronous version - giữ lại để backward compatibility)
  /// Mặc định format USD
  /// Format tiền double dựa trên locale code
  /// - 'km' (Campuchia): Dùng money2 để format sang KHR (Riel)
  /// - 'en' hoặc 'vi' hoặc mặc định: Format USD
  static String formatPriceDoubleWithLocale(double price, {String? localeCode}) {
    // Nếu không có localeCode, mặc định là 'en'
    final langCode = localeCode ?? 'en';

    // Nếu là tiếng Campuchia, dùng money2 để format sang KHR
    if (langCode == 'km') {
      try {
        // Lấy tỷ giá từ SharedPreferences, nếu không có thì dùng giá trị mặc định
        final exchangeRate = AppSP.get<double>(AppSP.exchangeRate) ?? 4008.50;
        final khrAmount = price * exchangeRate;
        print('💰 Converting to KHR: $price USD = $khrAmount KHR (rate: $exchangeRate)');

        // Sử dụng money2 để format KHR
        final khrCurrency = Currency.create('KHR', 0, symbol: '៛');
        // Thử cách 1: Dùng fromNum với currency
        try {
          final khr = Money.fromNum(khrAmount, isoCode: khrCurrency.isoCode);
          final formatted = khr.format('S###,###');
          return formatted;
        } catch (e1) {
          // Thử cách 2: Dùng fromInt với code
          try {
            final khrInt = khrAmount.toInt();
            final khr = Money.fromInt(khrInt, isoCode: khrCurrency.isoCode);
            final formatted = khr.format('S###,###');
            return formatted;
          } catch (e2) {
            // Fallback: Format đơn giản với NumberFormat
            final formatter = NumberFormat('#,##0', 'en_US');
            return '៛${formatter.format(khrAmount.toInt())}';
          }
        }
      } catch (e, stackTrace) {
        print('❌ Error formatting KHR: $e');
        print('Stack trace: $stackTrace');
        // Fallback về USD nếu có lỗi
        final formatter = NumberFormat.currency(
          locale: 'en_US',
          symbol: '\$',
          decimalDigits: 2,
        );
        return formatter.format(price);
      }
    }

    // Mặc định format USD cho tiếng Anh và tiếng Việt
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2, // Hiển thị 2 chữ số thập phân (chuẩn USD)
    );
    return formatter.format(price);
  }

  // Format cho số thực (double) - hiển thị 2 chữ số thập phân (synchronous version - giữ lại để backward compatibility)
  static String formatPriceDouble(double price) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2, // Hiển thị 2 chữ số thập phân (chuẩn USD)
    );
    return formatter.format(price);
  }

  static int calcDays(String? fromStr, String? toStr) {
    final from = parseDdMMyyyyHHmm(fromStr);
    final to = parseDdMMyyyyHHmm(toStr);
    if (from == null || to == null) return 1;
    final hours = to.difference(from).inHours;
    if (hours <= 0) return 1;
    final days = (hours / 24).ceil();
    return days;
  }

  static DateTime? parseDdMMyyyyHHmm(String? s) {
    if (s == null || s.isEmpty) return null;
    try {
      final parts = s.split(' ');
      final dmy = parts[0].split('/');
      final hm = parts[1].split(':');
      final dd = int.parse(dmy[0]);
      final mm = int.parse(dmy[1]);
      final yyyy = int.parse(dmy[2]);
      final HH = int.parse(hm[0]);
      final MM = int.parse(hm[1]);
      return DateTime(yyyy, mm, dd, HH, MM);
    } catch (_) {
      return null;
    }
  }

  static String buildDateRange(String? fromStr, String? toStr) {
    if (fromStr == null || toStr == null) return '';
    // Expect input as dd/MM/yyyy HH:mm
    final from = parseDdMMyyyyHHmm(fromStr);
    final to = parseDdMMyyyyHHmm(toStr);
    if (from == null || to == null) return '$fromStr - $toStr';
    String fmt(DateTime d) {
      final dd = d.day.toString().padLeft(2, '0');
      final mm = d.month.toString().padLeft(2, '0');
      final HH = d.hour.toString().padLeft(2, '0');
      final MM = d.minute.toString().padLeft(2, '0');
      return '$HH:$MM, $dd/$mm';
    }

    return '${fmt(from)} - ${fmt(to)}';
  }

  static String replacePathParams(String path, Map<String, String> params) {
    var result = path;
    params.forEach((key, value) {
      if (Utils.isNullOrEmpty(value)) {
        result = result.replaceAll('/{$key}', '');
      } else {
        result = result.replaceAll('{$key}', value);
      }
    });
    return result;
  }

  static String formatStringToCash({
    required dynamic cash,
    String? unit,
  }) {
    if (Utils.isNullOrEmpty(cash)) {
      return "0 VNĐ";
    }
    if (cash is String) {
      cash = double.parse(cash);
    }

    // // Determine the number of decimal places to display, maximum of 3
    // int decimal = cash is double
    //     ? min(3, (cash * 1000 % 10 > 0 ? 3 : 0)) // Checking if there are trailing decimals
    //     : 0;

    // Format the cash value using NumberFormat
    final numberFormat = NumberFormat('#,##0.000', 'en_US');
    String formattedCash = numberFormat.format(cash);

    if (cash is int || cash is double && cash == cash.round()) {
      formattedCash = NumberFormat('#,##0', 'en_US').format(cash);
    }

    // Modify the decimal places in the formatted string
    // if (decimal > 0) {
    //   formattedCash = cash.toStringAsFixed(decimal);
    // }

    if (!Utils.isNullOrEmpty(unit)) {
      formattedCash += " $unit";
    } else {
      formattedCash += " VNĐ";
    }

    return formattedCash;
  }

  static String valueText(value, {String? type, String? unit}) {
    if (type == ValueType.money.name) {
      return formatStringToCash(cash: value);
    } else if (type == ValueType.phoneNumber.name) {
      if (value is String && value.length <= 8) {
        return value
            .toString()
            .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ")
            .trimRight();
      }

      return value
          .toString()
          .replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ")
          .trimRight();
    } else if (type == ValueType.addUnit.name) {
      return formatStringToCash(cash: value, unit: unit);
    } else if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }

  static String convertGroundNameToString({required String floor, required String buildingName}) =>
      '$buildingName, $floor';

  static String pathWithQueryParams(String path, Map<String, dynamic> params) {
    String result = path;

    final Map<String, String> paramsString =
        params.map((key, value) => MapEntry(key, value.toString()));

    final queryParams = Uri(queryParameters: paramsString).query;

    if (queryParams.isNotEmpty) {
      result += '?$queryParams';
    }

    return result;
  }

  static String capitalizeFirstCharacter({required String s}) {
    return s[0].toUpperCase() + s.substring(1);
  }
}

enum ValueType {
  number,
  string,
  money,
  addUnit,
  phoneNumber,
  ground,
  time,
  dateTime,
}
