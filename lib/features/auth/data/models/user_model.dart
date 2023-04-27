import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String email,
    required String fullName,
    String? password,
  }) : super(
          email: email,
          fullName: fullName,
          password: password,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
