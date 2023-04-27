import 'package:avangenio/features/auth/data/datasource/user_local_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_user_repository.dart';

class AuthUserRepositoryImpl extends AuthUserRepository {
  final UserLocalDataSource dataSource;

  AuthUserRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, User>> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      //? Aqui se deberia llamar al metodo del api para obtener al usuario logueado pero como es de prueba lo omiti al no tener un API...
      final user = await dataSource.loginUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return const Left(CacheFailure(properties: []));
    }
  }

  @override
  Future<Either<Failure, User>> registerUserWithEmailAndPassword(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      //? Aqui se deberia llamar al metodo del api para obtener al usuario logueado pero como es de prueba lo omiti al no tener un API...
      final user = await dataSource.registerUserWithEmailAndPassword(
        email: email,
        fullName: fullName,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return const Left(ServerFailure(properties: []));
    }
  }
}
