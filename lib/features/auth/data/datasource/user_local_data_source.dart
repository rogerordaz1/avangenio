import 'dart:async';
import 'dart:convert';

import 'package:avangenio/core/error/exeptions.dart';
import 'package:avangenio/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<UserModel> loginUserWithEmailAndPassword(
      {required String email, required String password});

  //////////////////////
  Future<UserModel> registerUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  });
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<UserModel> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    final userJson = sharedPreferences.getString(email);
    print(userJson);

    if (userJson != null) {
      var user = UserModel.fromJson(jsonDecode(userJson));

      await sharedPreferences.setBool('loged', true);
      await sharedPreferences.setString('emailLoged', email);

      return user;
    } else {
      throw CacheExeption();
    }
  }

  @override
  Future<UserModel> registerUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    var user = UserModel(email: email, fullName: fullName, password: password);

    final valor = await sharedPreferences.setString(email, jsonEncode(user));
    await sharedPreferences.setBool('loged', true);
    await sharedPreferences.setString('emailLoged', email);

    if (valor) {
      return user;
    } else {
      throw CacheExeption();
    }
  }
}
