import 'package:avangenio/features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final LoginUserWithEmailAndPasswordUsecase usecase;

  LoginProvider({
    required this.sharedPreferences,
    required this.usecase,
  });

  LoginState _state = LoginInitial();
  LoginState get state => _state;

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _state = LoginLoading();
    notifyListeners();

    final either = await usecase(email: email, password: password);

    either.fold(
      (failure) {
        _state = const LoginError(
            'Para iniciar session debe estar guardado en el almacenamiento del telefono');
        notifyListeners();
      },
      (user) {
        _state = LoginSussess(user: user);
        notifyListeners();
      },
    );
  }

  void changeToINitialState() {
    _state = LoginInitial();
    notifyListeners();
  }
}
