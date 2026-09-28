class NumberFormatter {
  NumberFormatter._();

  static String decimal(num value) {
    final negative = value < 0;
    final absValue = value.abs();
    final isInt = absValue == absValue.roundToDouble();
    final raw = isInt ? absValue.round().toString() : absValue.toStringAsFixed(2);
    final parts = raw.split('.');
    final integer = parts.first.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'),
      (match) => '${match[1]},',
    );
    final formatted = parts.length > 1 ? '$integer.${parts[1]}' : integer;
    return negative ? '-$formatted' : formatted;
  }

  static double parse(String raw) {
    return double.tryParse(raw.replaceAll(RegExp(r'[^\d.-]'), '')) ?? 0;
  }

  /// Compact VND: `373,6tr` / `1,2tỷ` (VN decimal comma).
  static String compactTrieu(num value) {
    final negative = value < 0;
    final abs = value.abs().toDouble();
    final sign = negative ? '-' : '';

    if (abs >= 1000000000) {
      return '$sign${_vnOneDecimal(abs / 1000000000)}tỷ';
    }
    if (abs >= 1000000) {
      return '$sign${_vnOneDecimal(abs / 1000000)}tr';
    }
    return '$sign${decimal(abs.round())}';
  }

  static String _vnOneDecimal(double value) {
    if (value == value.roundToDouble()) return value.round().toString();
    return value.toStringAsFixed(1).replaceAll('.', ',');
  }
}
