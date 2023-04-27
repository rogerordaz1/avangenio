import 'package:dartz/dartz.dart';


import '../../../../core/error/failure.dart';
import '../entities/user.dart';
import '../repositories/auth_user_repository.dart';

class RegisterUserWithEmailAndPasswordUsecase {
  final AuthUserRepository authUserRepository;

  RegisterUserWithEmailAndPasswordUsecase(this.authUserRepository);

  Future<Either<Failure, User>> call(
      {required String fullName,
      required String email,
      required String password}) async {
    return await authUserRepository.registerUserWithEmailAndPassword(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
