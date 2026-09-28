import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:vbindex/data/services/auth_session_notifier.dart';

final class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await AppSecureStorage.getToken();
    final accessToken = token?.accessToken?.trim();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      AuthSessionNotifier.notifySessionExpired();
    }
    handler.next(err);
  }
}
