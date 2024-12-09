import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';

class IFirebaseAuth {
  IFirebaseAuth(firebase.FirebaseAuth? firebaseAuth)
      : _firebaseAuth = firebaseAuth ?? firebase.FirebaseAuth.instance;

  final firebase.FirebaseAuth _firebaseAuth;

  firebase.User? get _currentUserDetail {
    return _firebaseAuth.currentUser;
  }

  UserAccountModel? get currentUser {
    return _firebaseAuth.currentUser?.toAccount;
  }

  bool get isAuthenticated => _currentUserDetail?.uid == null ? false : true;

  AuthEmailMethod get authEmailMethod {
    return AuthEmailMethod(
      firebaseAuth: _firebaseAuth,
    );
  }

  Future<String?> getIdToken() async {
    if (_currentUserDetail == null) return null;
    final token = await _currentUserDetail!.getIdToken();
    return token;
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on User {
  UserAccountModel get toAccount => UserAccountModel(
        uid: uid,
        name: displayName,
        email: email,
      );
}
