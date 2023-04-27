import 'dart:async';

import 'package:avangenio/features/auth/data/repositories/auth_user_repository_impl.dart';
import 'package:avangenio/features/auth/presentation/blocs/authentication/authentication_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/login/login_provider.dart';
import 'package:avangenio/features/auth/presentation/blocs/register/register_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasource/user_local_data_source.dart';
import '../../features/auth/domain/repositories/auth_user_repository.dart';
import '../../features/auth/domain/usecases/login_user_with_email_and_password_usecase.dart';
import '../../features/auth/domain/usecases/register_user_with_email_and_password_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

//////////////////////////////////////////////////////////////
  //? DataSources
  final SharedPreferences sharedPreferencesInstance = await getIt.getAsync();

  getIt.registerSingleton<UserLocalDataSource>(
      UserLocalDataSourceImpl(sharedPreferences: sharedPreferencesInstance));

  // getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl(
  //     client: getIt<http.Client>(), sharedPreferences: await getIt.getAsync()));

  //?Repositories
  getIt.registerSingleton<AuthUserRepository>(
    AuthUserRepositoryImpl(
      dataSource: getIt<UserLocalDataSource>(),
    ),
  );

  //? UseCases
  //?Login UseCases...

  getIt.registerLazySingleton(
      () => LoginUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));
  getIt.registerLazySingleton(()  =>
      RegisterUserWithEmailAndPasswordUsecase(getIt<AuthUserRepository>()));

  //? Providers
  //Blocs
  getIt.registerFactory<AutheticationProvider>(
    () => AutheticationProvider(sharedPreferencesInstance),
  );
  getIt.registerFactoryAsync<LoginProvider>(
    () async => LoginProvider(
      usecase: getIt<LoginUserWithEmailAndPasswordUsecase>(),
      
      sharedPreferences: sharedPreferencesInstance,
    ),
  );
  getIt.registerFactoryAsync<RegisterProvider>(
    () async => RegisterProvider(
      usecase: getIt<RegisterUserWithEmailAndPasswordUsecase>(),
      sharedPreferences: sharedPreferencesInstance,
    ),
  );
}
