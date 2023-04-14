// ignore_for_file: empty_catches, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:ivykids_assignment/utils/error-handling.dart';
import 'package:ivykids_assignment/utils/global_vatiables.dart';
import 'package:ivykids_assignment/utils/utils.dart';

class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          phone: phone,
          password: password,
          token: '');
      http.Response res = await http.post(Uri.parse('$uri/auth/signup'),
          // body: user.toJson(),
          body: json.encode(user.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
            // 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created!!');
          });
    } catch (e) {
      log('$uri/auth/signup');
      log(e.toString());
      showSnackBar(context, '${e.toString}');
    }
  }
}
