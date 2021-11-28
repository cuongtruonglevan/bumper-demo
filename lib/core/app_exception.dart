import 'package:flutter/services.dart';

/// Base class for app exceptions.
class AppException implements Exception {
  final String internalMessage;

  /// An uri of localized error message.
  /// For example `error.noUserProfile`.
  final String userFriendlyMessageUri;

  AppException(
      {required this.internalMessage,
      this.userFriendlyMessageUri = 'error.default'});

  factory AppException.fromException(dynamic exception) {
    if (exception is AppException) {
      return exception;
    } else if (exception is PlatformException) {
      return AppException._fromPlatformException(exception);
    } else {
      return AppException(
        internalMessage: exception.toString(),
        userFriendlyMessageUri: 'error.default',
      );
    }
  }

  factory AppException._fromPlatformException(PlatformException exception) {
    String userFriendlyMessageUri = 'error.default';
    return AppException(
      internalMessage: exception.message!,
      userFriendlyMessageUri: userFriendlyMessageUri,
    );
  }

  @override
  String toString() {
    return internalMessage;
  }
}

class UnauthorizedAppException extends AppException {
  UnauthorizedAppException() : super(internalMessage: '401 Unauthorized');
}
