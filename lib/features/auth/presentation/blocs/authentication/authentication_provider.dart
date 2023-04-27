import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'autentication_state.dart';

class AutheticationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  AutheticationProvider(this.sharedPreferences);

  AuthenticationState _state = AuthenticationUninitialized();

  AuthenticationState get state => _state;

  void onAppStart() {
    _state = AuthenticationLoading();
    notifyListeners();

    final isLogged = sharedPreferences.getBool('loged');

    if (isLogged != null) {
      if (isLogged) {
        _state = AuthenticationAuthenticated();
        notifyListeners();
      }
    } else {
      _state = AuthenticationUnauthenticated();
      notifyListeners();
    }
  }

  void loggedInUser() {
    _state = AuthenticationLoading();
    notifyListeners();

    _state = AuthenticationAuthenticated();
    notifyListeners();
  }

  void loggedOutUser() async {
    _state = AuthenticationLoading();
    notifyListeners();

    await sharedPreferences.remove('loged');

    _state = AuthenticationUnauthenticated();
    notifyListeners();
  }
}
