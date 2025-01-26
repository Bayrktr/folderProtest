import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions_constant.dart';

final class CloudStoragePutFileFailure implements Exception {
  const CloudStoragePutFileFailure([this.message = '']);

  final String message;

  factory CloudStoragePutFileFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.objectNotFound:
        return CloudStoragePutFileFailure('');

      case FirebaseExceptionsConstant.unauthorized:
        return CloudStoragePutFileFailure('');
      case FirebaseExceptionsConstant.unauthenticated:
        return CloudStoragePutFileFailure('');
      case FirebaseExceptionsConstant.invalidArgument:
        return CloudStoragePutFileFailure('');

      case FirebaseExceptionsConstant.retryLimitExceeded:
        return CloudStoragePutFileFailure('');

      default:
        return const CloudStoragePutFileFailure();
    }
  }
}

final class CloudStorageDeleteFailure implements Exception {
  const CloudStorageDeleteFailure([this.message = '']);

  final String message;

  factory CloudStorageDeleteFailure.fromCode(String code) {
    switch (code) {
      case FirebaseExceptionsConstant.objectNotFound:
        return CloudStorageDeleteFailure('');

      case FirebaseExceptionsConstant.unauthorized:
        return CloudStorageDeleteFailure('');
      case FirebaseExceptionsConstant.unauthenticated:
        return CloudStorageDeleteFailure('');
      case FirebaseExceptionsConstant.invalidArgument:
        return CloudStorageDeleteFailure('');

      default:
        return const CloudStorageDeleteFailure();
    }
  }
}
