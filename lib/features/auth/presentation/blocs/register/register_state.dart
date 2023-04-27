import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSussess extends RegisterState {
  final User user;

  const RegisterSussess({required this.user});

  @override
  List<Object> get props => [user];
}

class RegisterError extends RegisterState {
  final String? message;

  const RegisterError({this.message});
  @override
  List<Object?> get props => [message];
}
