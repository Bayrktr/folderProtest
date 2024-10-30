import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DocuSort/app/features/splash/bloc/splash_state.dart';
import 'package:DocuSort/app/product/init/app_init.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState());

  Future<void> startApp() async {
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    try {
      await AppInit.splashInit();
      emit(
        state.copyWith(
          status: SplashStatus.finish,
        ),
      );
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          status: SplashStatus.error,
        ),
      );
    }
  }
}
