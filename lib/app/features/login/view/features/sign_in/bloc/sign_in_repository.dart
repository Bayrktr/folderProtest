import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:DocuSort/app/product/service/auth/firebase/auth_methods/email/auth_email_method.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';

abstract class ISignInRepository {
  IFirebaseAuth get _firebaseAuth;

  Future<void> signIn({
    required String email,
    required String password,
  });
}

class SignInRepository implements ISignInRepository {
  @override
  final IFirebaseAuth _firebaseAuth = GetItManager.getIt<IFirebaseAuth>();

  AuthEmailMethod get _authEmailMethod => _firebaseAuth.authEmailMethod;

  UserAccountModel? get accountModel => _firebaseAuth.currentUser;

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _authEmailMethod.signIn(email: email, password: password);
  }
}
