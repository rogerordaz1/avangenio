import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? fullName;
  final String email;

  const User({
    this.fullName,
    required this.email,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
      ];
}
