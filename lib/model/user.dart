import 'dart:convert';

import 'package:ivykids_assignment/model/contact.dart';
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
  List<Contacts> contacts;

  User(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.token,
      required this.contacts});

  // factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  // Map<String, dynamic> toJson() => _$UserToJson(this);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
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
      contacts: (map['contacts'] as List<dynamic>?)
          ?.map((e) => Contacts.fromJson(e))
          .toList() ?? []
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
