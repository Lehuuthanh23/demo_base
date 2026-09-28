import 'package:core/core.dart';

final class AuthSessionService {
  const AuthSessionService();

  Future<bool> hasValidSession() async {
    final token = await AppSecureStorage.getToken();
    final access = token?.accessToken?.trim();
    return access != null && access.isNotEmpty;
  }
}
