import 'dart:convert';

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

  // factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  // Map<String, dynamic> toJson() => _$UserToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone':phone,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone:phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}
