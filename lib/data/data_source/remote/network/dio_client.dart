import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vbindex/data/data_source/remote/network/auth_interceptor.dart';
import 'package:vbindex/data/data_source/remote/network/full_dio_logger.dart';

final class AppDioClient {
  AppDioClient._();

  static const int _connectTimeout = 30;
  static const int _receiveTimeout = 30;
  static const int _sendTimeout = 30;

  static Dio create({required String baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: _connectTimeout),
        receiveTimeout: const Duration(seconds: _receiveTimeout),
        sendTimeout: const Duration(seconds: _sendTimeout),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: const {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(FullDioLogger());
    }

    return dio;
  }
}
