import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/entities/user.dart';
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
        final userEmail = sharedPreferences.getString('emailLoged');
        
        if (userEmail != null && userEmail != '') {
        final userJson = sharedPreferences.getString(userEmail);
          
          var user = UserModel.fromJson(jsonDecode(userJson!));

          _state = AuthenticationAuthenticated(user);
          notifyListeners();
        } else {
          _state = AuthenticationUnauthenticated();
          notifyListeners();
        }

        
      } else {
        _state = AuthenticationUnauthenticated();
        notifyListeners();
      }
    } else {
      _state = AuthenticationUnauthenticated();
      notifyListeners();
    }
  }

  void loggedInUser(User user) {
    _state = AuthenticationLoading();
    notifyListeners();

    _state = AuthenticationAuthenticated(user);
    notifyListeners();
  }

  void loggedOutUser() async {
    _state = AuthenticationLoading();
    notifyListeners();

    await sharedPreferences.setBool('loged', false);
    await sharedPreferences.setString('emailLoged', '');

    _state = AuthenticationUnauthenticated();
    notifyListeners();
  }
}
