part of '../core.dart';

class RegexUtils {
  static bool isUsernameValid(String userName) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9]{3,}$');
    return regExp.hasMatch(userName);
  }

  static bool isPasswordValid(String pw) {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$');
    return regExp.hasMatch(pw);
  }

  static bool isEmailValid(String email) {
    final normalized = email.trim();
    if (normalized.isEmpty) return false;
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regExp.hasMatch(normalized);
  }

  static bool isPhoneNumberValid(String phone) {
    final normalized = _normalizePhone(phone);
    if (normalized.isEmpty) return false;

    // Đầu số VN (03/05/07/08/09): chỉ chấp nhận đúng 10 số, không rơi sang rule Campuchia.
    if (_isVietnamMobilePrefix(normalized)) {
      return RegExp(r'^0[35789][0-9]{8}$').hasMatch(normalized);
    }

    // Campuchia
    return RegExp(r'^(?:0[1-9][0-9]{7,8}|\+855[1-9][0-9]{7,8})$').hasMatch(normalized);
  }

  static bool _isVietnamMobilePrefix(String normalized) {
    if (!normalized.startsWith('0') || normalized.length < 2) return false;
    return '35789'.contains(normalized[1]);
  }

  static String _normalizePhone(String phone) {
    var normalized = phone.trim().replaceAll(RegExp(r'[\s\-.]'), '');
    if (normalized.startsWith('+84')) {
      normalized = '0${normalized.substring(3)}';
    } else if (normalized.startsWith('84') && normalized.length == 11) {
      normalized = '0${normalized.substring(2)}';
    }
    return normalized;
  }

  /// Trả `true` nếu để trống hoặc là số điện thoại hợp lệ.
  static bool isOptionalPhoneValid(String? phone) {
    final trimmed = phone?.trim() ?? '';
    if (trimmed.isEmpty) return true;
    return isPhoneNumberValid(trimmed);
  }

  /// Trả `true` nếu để trống hoặc là email hợp lệ.
  static bool isOptionalEmailValid(String? email) {
    final trimmed = email?.trim() ?? '';
    if (trimmed.isEmpty) return true;
    return isEmailValid(trimmed);
  }
}
