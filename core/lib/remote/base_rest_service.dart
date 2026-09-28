part of '../core.dart';

/// Base wrapper for Retrofit clients.
/// Subclass in app layer, init [restClient] and expose API methods in one file.
abstract class BaseRestService<C> {
  final Dio dio;
  final String baseUrl;
  late final C restClient;

  BaseRestService(
    this.dio, {
    String? baseUrl,
    required C Function(Dio dio, {String? baseUrl}) createClient,
  }) : baseUrl = baseUrl ?? Environments.getUrl() {
    restClient = createClient(dio, baseUrl: this.baseUrl);
  }
}
