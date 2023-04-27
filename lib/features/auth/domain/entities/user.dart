import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? fullName;
  final String email;
  final String? password;

  const User({
    this.password,
    this.fullName,
    required this.email,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
      ];
}
