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
    

    final userJson = sharedPreferences.getString('user');

    if (userJson != null) {
      var user = UserModel.fromJson(jsonDecode(userJson));

      await sharedPreferences.setBool('loged', true);

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
    var user = UserModel(email: email, fullName: fullName);

    final valor = await sharedPreferences.setString('user', jsonEncode(user));
    await sharedPreferences.setBool('loged', true);

    if (valor) {
      return user;
    } else {
      throw CacheExeption();
    }
  }
}
