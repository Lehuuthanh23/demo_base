import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.mess, this.statusCode});

  final String mess;
  final int? statusCode;

  @override
  List<Object?> get props => [mess, statusCode];
}

final class ServerFailure extends Failure {
  const ServerFailure({
    required super.mess,
    super.statusCode,
    this.accountStatus,
    this.retryAfter,
  });

  /// `ACTIVE` | `TEMPORARILY_DISABLED` | `PERMANENTLY_DISABLED` | `LOCKED`
  final String? accountStatus;

  /// Seconds to wait before retry (e.g. resend OTP 429).
  final int? retryAfter;

  @override
  List<Object?> get props => [mess, statusCode, accountStatus, retryAfter];
}

final class NoConnectionFailure extends Failure {
  const NoConnectionFailure({required super.mess});
}

/// Biometric auth failed; [openSettings] when user should enable Face ID / biometrics.
final class BiometricFailure extends Failure {
  const BiometricFailure({
    required super.mess,
    this.openSettings = false,
  });

  final bool openSettings;

  @override
  List<Object?> get props => [mess, statusCode, openSettings];
}
