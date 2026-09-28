import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Required for FCM / APNs token registration.
    application.registerForRemoteNotifications()

    // Become notification-center delegate BEFORE super so firebase_messaging
    // sees FlutterAppLifeCycleProvider and does NOT steal the delegate.
    // Otherwise FCM keeps alert:false and local notifications never banner.
    UNUserNotificationCenter.current().delegate = self

    let launched = super.application(application, didFinishLaunchingWithOptions: launchOptions)

    // Re-assert after plugins init (some reclaim the delegate).
    UNUserNotificationCenter.current().delegate = self

    _registerAppSettingsChannel()
    _registerScreenCornerRadiusChannel()
    return launched
  }

  /// Presentation (completionHandler đúng 1 lần):
  /// - Remote FCM sync giá (`prices_patched` / `world_quotes_patched`) → không banner
  /// - Remote FCM khác (vd. price_alert): cũng ẩn ở foreground — Dart hiện local noti
  /// - Local (flutter_local_notifications) → hiện banner (alert thật)
  ///
  /// Lưu ý: khi app nền/tắt, iOS hiện banner theo APNs `alert`. BE phải gửi
  /// silent (không alert) cho sync giá; chỉ `price_alert` mới có notification.
  /// Always call `super` first so firebase_messaging still emits `onMessage`.
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler:
      @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    let userInfo = notification.request.content.userInfo
    let isRemoteFcm = userInfo["gcm.message_id"] != nil
    let type = (userInfo["type"] as? String) ?? ""
    let isPriceSync =
      type == "prices_patched" || type == "world_quotes_patched"

    // Plugins handle onMessage / bookkeeping; ignore their presentation choice.
    super.userNotificationCenter(
      center,
      willPresent: notification,
      withCompletionHandler: { _ in }
    )

    // Sync giá: không bao giờ hiện banner (foreground).
    // price_alert remote: ẩn — Dart `_showForegroundNotification` hiện local.
    if isRemoteFcm && (isPriceSync || type == "price_alert" || type.isEmpty) {
      completionHandler([])
      return
    }
    if isRemoteFcm {
      completionHandler([])
      return
    }
    if #available(iOS 14.0, *) {
      completionHandler([.banner, .list, .sound, .badge])
    } else {
      completionHandler([.alert, .sound, .badge])
    }
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    super.userNotificationCenter(
      center,
      didReceive: response,
      withCompletionHandler: completionHandler
    )
  }

  private func _registerAppSettingsChannel() {
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }
    let channel = FlutterMethodChannel(
      name: "vbindex/app_settings",
      binaryMessenger: controller.binaryMessenger
    )
    channel.setMethodCallHandler { call, result in
      if call.method == "open" {
        if let url = URL(string: UIApplication.openSettingsURLString) {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
          result(true)
        } else {
          result(false)
        }
      } else if call.method == "openSubscriptions" {
        let candidates = [
          "itms-apps://apps.apple.com/account/subscriptions",
          "https://apps.apple.com/account/subscriptions",
        ]
        for candidate in candidates {
          if let url = URL(string: candidate), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            result(true)
            return
          }
        }
        result(false)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private func _registerScreenCornerRadiusChannel() {
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }
    let channel = FlutterMethodChannel(
      name: "vbindex/screen_corner_radius",
      binaryMessenger: controller.binaryMessenger
    )
    channel.setMethodCallHandler { call, result in
      if call.method == "get" {
        let radius =
          (UIScreen.main.value(forKey: "_displayCornerRadius") as? CGFloat) ?? 0
        result([
          "topLeft": radius,
          "topRight": radius,
          "bottomLeft": radius,
          "bottomRight": radius,
        ])
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
  }
}
