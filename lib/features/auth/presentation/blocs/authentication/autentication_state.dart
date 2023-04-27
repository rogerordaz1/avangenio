import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  const AuthenticationAuthenticated(this.user);
  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {}
