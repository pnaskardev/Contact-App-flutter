import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.token});

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
