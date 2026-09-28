import 'dart:convert';

import 'package:dio/dio.dart';

class FullDioLogger extends Interceptor {
  static const _chunkSize = 800;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('┌── Request ────────────────────────────────')
      ..writeln('${options.method} ${options.uri}')
      ..writeln('Headers: ${_pretty(options.headers)}');
    if (options.data != null) {
      buffer.writeln('Body: ${_pretty(options.data)}');
    }
    buffer.write('└───────────────────────────────────────────');
    _log(buffer.toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('┌── Response ───────────────────────────────')
      ..writeln('${response.statusCode} ${response.requestOptions.uri}')
      ..writeln('Body: ${_pretty(response.data)}')
      ..write('└───────────────────────────────────────────');
    _log(buffer.toString());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final buffer = StringBuffer()
      ..writeln('┌── Error ──────────────────────────────────')
      ..writeln('${err.requestOptions.method} ${err.requestOptions.uri}')
      ..writeln('${err.type}: ${err.message}');
    if (err.response?.data != null) {
      buffer.writeln('Body: ${_pretty(err.response?.data)}');
    }
    buffer.write('└───────────────────────────────────────────');
    _log(buffer.toString());
    handler.next(err);
  }

  String _pretty(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      if (data is String) {
        final decoded = jsonDecode(data);
        return const JsonEncoder.withIndent('  ').convert(decoded);
      }
    } catch (_) {}
    return data.toString();
  }

  void _log(String message) {
    for (var i = 0; i < message.length; i += _chunkSize) {
      final end = (i + _chunkSize).clamp(0, message.length);
      // ignore: avoid_print
      print(message.substring(i, end));
    }
  }
}
