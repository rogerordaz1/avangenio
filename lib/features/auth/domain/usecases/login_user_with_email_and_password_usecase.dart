import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_user_repository.dart';

class LoginUserWithEmailAndPasswordUsecase {
  final AuthUserRepository authUserRepository;

  LoginUserWithEmailAndPasswordUsecase(this.authUserRepository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await authUserRepository.loginUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
