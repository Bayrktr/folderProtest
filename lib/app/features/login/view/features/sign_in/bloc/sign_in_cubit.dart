import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_repository.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_state.dart';
import 'package:DocuSort/app/product/model/user_account/user_account_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  final SignInRepository _signInRepository = SignInRepository();

  UserAccountModel? get accountModel => _signInRepository.accountModel;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  Future<void> signIn(
    String? email,
    String? password,
  ) async {
    if (email == null || password == null) {
      emit(
        state.copyWith(
          popUpStatus: SignInPopUpStatus.cantBeEmpty,
        ),
      );
    }
    emit(
      state.copyWith(
        status: SignInStatus.loading,
      ),
    );
    try {
      await _signInRepository.signIn(email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          popUpException: e,
          popUpStatus: SignInPopUpStatus.other,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SignInStatus.error,
        ),
      );
    }
  }

  void updateEmailController(String? value) {
    if (value == null) return;
    _emailController.text = value;
  }

  void updatePasswordController(String? value) {
    if (value == null) return;
    _passwordController.text = value;
  }

  void changeKeepSigned() {
    emit(
      state.copyWith(isKeepSigned: !state.isKeepSigned),
    );
  }

  void changePasswordVisible() {
    emit(
      state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ),
    );
  }
}
