part of '../core.dart';

class DeviceUtils {
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static getStatusBarHeight(BuildContext context) => MediaQuery.of(context).viewPadding.top;

  static double getHeight3(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return MediaQuery.of(context).size.height - padding.top - kToolbarHeight;
  }

  static Future<String?> getDeviceId() async {
    final existing = AppSP.get<String>(AppSP.deviceUuid);
    if (existing != null && existing.isNotEmpty) return existing;

    final uuid = const Uuid().v4();
    await AppSP.set(AppSP.deviceUuid, uuid);
    return uuid;
  }
}
