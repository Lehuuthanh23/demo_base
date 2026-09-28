typedef AuthSessionExpiredCallback = void Function();

/// Hook invoked when refresh token is invalid and the user must sign in again.
final class AuthSessionNotifier {
  AuthSessionNotifier._();

  static AuthSessionExpiredCallback? onSessionExpired;

  static void notifySessionExpired() {
    onSessionExpired?.call();
  }
}
