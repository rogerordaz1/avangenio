import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user.dart';

abstract class AuthUserRepository {
  Future<Either<Failure, User>> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /////////////////////
  Future<Either<Failure, User>> registerUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  });
}
