import 'package:avangenio/features/auth/presentation/blocs/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecases/register_user_with_email_and_password_usecase.dart';
import '../authentication/authentication_provider.dart';

class RegisterProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final RegisterUserWithEmailAndPasswordUsecase usecase;
  

  RegisterProvider({
    required this.sharedPreferences,
    required this.usecase,
   
  });

  RegisterState _state = RegisterInitial();
  RegisterState get state => _state;

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _state = RegisterLoading();
    notifyListeners();

    final either = await usecase.call(
        email: email, password: password, fullName: fullName);

    either.fold(
      (failure) {
        _state =
            const RegisterError(message: 'Halgo ha salido mal con el login');
      },
      (user) {
        _state = RegisterSussess(user: user);
        
      },
    );

    notifyListeners();
  }
}
