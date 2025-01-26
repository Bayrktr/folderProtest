import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions_constant.dart';

final class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.invalidEmail:
        return SignUpWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.userDisabled:
        return SignUpWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.emailAlreadyInUse:
        return SignUpWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.operationNotAllowed:
        return SignUpWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.weakPassword:
        return SignUpWithEmailAndPasswordFailure('');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

final class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  final String message;

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.invalidEmail:
        return LogInWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.userDisabled:
        return LogInWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.userNotFound:
        return LogInWithEmailAndPasswordFailure('');
      case FirebaseExceptionsConstant.wrongPassword:
        return LogInWithEmailAndPasswordFailure('');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

final class LogOutFailure implements Exception {}

final class EmailVerificationFailure implements Exception {
  const EmailVerificationFailure([
    this.message = '',
  ]);

  final String message;

  factory EmailVerificationFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.emailAlreadyVerified:
        return EmailVerificationFailure('');
      case FirebaseExceptionsConstant.expiredActionCode:
        return EmailVerificationFailure('');
      case FirebaseExceptionsConstant.invalidActionCode:
        return EmailVerificationFailure('');
      case FirebaseExceptionsConstant.internalError:
        return EmailVerificationFailure('');
      default:
        return const EmailVerificationFailure();
    }
  }
}

final class UserNotSignInFailure implements Exception {
  const UserNotSignInFailure([
    this.message = '',
  ]);

  final String message;
}
