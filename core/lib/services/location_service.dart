// part of '../core.dart';

import 'package:flutter/foundation.dart';

import '../core.dart';

final class CoreLocationService {
  static final CoreLocationService _instance = CoreLocationService._internal();

  factory CoreLocationService() => _instance;

  CoreLocationService._internal();

  static Position? _cachedPosition;
  static DateTime? _lastUpdated;

  /// Trả về vị trí mới nhất đã cache. Nếu `forceRefresh` = false và còn cache,
  /// trả thẳng cache để tránh gọi lại GPS/permission tốn thời gian.
  /// Đặt `forceRefresh=true` khi cần lấy vị trí mới hoàn toàn.
  Future<Position?> getCurrentLocation({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedPosition != null) {
      return _cachedPosition;
    }
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Log.e('Location services are disabled');
        debugPrint('Location services are disabled');
        return null;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Log.e('Location permissions are denied');
          debugPrint('Location permissions are denied');
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Log.e('Location permissions are permanently denied');
        debugPrint('Location permissions are permanently denied');
        return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
      _cachedPosition = position;
      _lastUpdated = DateTime.now();
      return position;
    } catch (e) {
      Log.e('Error getting location: $e');
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  Stream<Position> getLocationStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }

  Future<bool> hasPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  /// Lấy vị trí đã cache (không gọi GPS). Trả về null nếu chưa có.
  Position? get cachedPosition => _cachedPosition;

  /// Thời điểm cache lần cuối (nullable).
  DateTime? get lastUpdated => _lastUpdated;
}
