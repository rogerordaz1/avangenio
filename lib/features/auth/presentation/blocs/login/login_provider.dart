import 'package:avangenio/features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final LoginUserWithEmailAndPasswordUsecase usecase;
  final AutheticationProvider autheticationProvider;
  LoginProvider({
    required this.autheticationProvider,
    required this.sharedPreferences,
    required this.usecase,
  });

  LoginState _state = LoginInitial();
  LoginState get state => _state;
  bool isLoading = false;

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _state = LoginLoading();
    isLoading = true;
    notifyListeners();

    final either = await usecase.call(email: email, password: password);

    either.fold(
      (failure) {
        _state = const LoginError('Halgo ha salido mal con el login');
      },
      (user) {
        _state = LoginSussess(user: user);
        autheticationProvider.loggedInUser();
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
