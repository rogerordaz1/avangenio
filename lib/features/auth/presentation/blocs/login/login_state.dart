import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSussess extends LoginState {
  final User user;
 

  const LoginSussess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginError extends LoginState {
  final String? message;

  const LoginError(this.message);
  @override
  List<Object?> get props => [message];
}
