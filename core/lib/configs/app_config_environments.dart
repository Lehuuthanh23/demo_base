part of '../core.dart';

class EnvironmentConfig {
  /// Giá trị build-time từ `--dart-define=ENVIRONMENT=QA|DEV|PROD` hoặc `--dart-define=ENV=...`.
  static const String buildEnvironment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: String.fromEnvironment('ENV'),
  );

  /// Khởi tạo môi trường — gọi sau [Di.init], trước mọi [Environments.get*].
  ///
  /// Thứ tự ưu tiên:
  /// 1. `--dart-define=ENVIRONMENT=...` (cố định lúc build)
  /// 2. Giá trị đã lưu trong SharedPreferences
  /// 3. Mặc định DEV
  static Future<void> bootstrap() async {
    await setEnvironment(_resolveEnvironment());
  }

  static String _resolveEnvironment() {
    if (buildEnvironment.isNotEmpty) {
      return _normalize(buildEnvironment);
    }

    return _normalize(getEnvironment() ?? Environments.dev);
  }

  static String _normalize(String value) {
    final upper = value.toUpperCase();
    const allowed = [
      Environments.dev,
      Environments.qa,
      Environments.production,
    ];
    if (!allowed.contains(upper)) {
      throw ArgumentError('Unknown environment: $value. Use DEV, QA, or PROD.');
    }

    return upper;
  }

  static Future<void> setEnvironment(String value) async {
    await AppSP.set(AppSP.environment, _normalize(value));
  }

  static String? getEnvironment() {
    return AppSP.get(AppSP.environment);
  }
}

class Environments {
  static const String production = 'PROD';
  static const String qa = 'QA';
  static const String dev = 'DEV';

  static String get _currentEnvironments =>
      EnvironmentConfig.getEnvironment() ?? dev;

  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.dev,  
      'appName': 'Demo Base',
      // Simulator/iOS: localhost. Android emulator: dùng 10.0.2.2
      'url': 'https://vbindex-sandbox.biexce.com/api/v1/',
      // 'url': 'http://192.168.1.141:4001/api/v1/',
    },
    {
      'env': Environments.qa,
      'appName': 'Demo Base',
      'url': 'https://vbindex.biexce.com/api/v1/',
    },
    {
      'env': Environments.production,
      'appName': 'Demo Base',
      'url': 'https://vbindex.biexce.com/api/v1/',
    },
  ];

  static String getAppName() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['appName'] ??
        'Demo Base';
  }

  static String getUrl() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['url'] ??
        '';
  }

  /// Origin only, e.g. `http://10.100.0.52:4000` from `.../api/v1/`.
  static String getOrigin() {
    final uri = Uri.tryParse(getUrl());
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return '';
    final port = uri.hasPort ? ':${uri.port}' : '';
    return '${uri.scheme}://${uri.host}$port';
  }

  /// Joins API host origin with a relative [path] (or returns absolute URLs as-is).
  static String? resolveMediaUrl(String? path) {
    final trimmed = path?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return trimmed;
    }
    final origin = getOrigin();
    if (origin.isEmpty) return null;
    final normalized = trimmed.startsWith('/') ? trimmed : '/$trimmed';
    return '$origin$normalized';
  }

  static String getEnvironment() {
    return _availableEnvironments.firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )['env'] ??
        Environments.dev;
  }
}
