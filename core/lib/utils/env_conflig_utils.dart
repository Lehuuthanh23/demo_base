part of '../core.dart';

class EnvConfig {
  static Future<void> load() async {
    await dotenv.load(fileName: "core/.env");
  }

  static String get mapboxToken => dotenv.env['MAPBOX_TOKEN'] ?? '';
}
