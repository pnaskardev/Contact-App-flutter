import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user =
      User(id: '', name: '', phone: '', email: '', password: '', token: '');

  User get user => _user;

  void setUser(String user) {
    var map = jsonDecode(user);
    // log(map);
    _user = User.fromJson(map);
    notifyListeners();
  }
}
