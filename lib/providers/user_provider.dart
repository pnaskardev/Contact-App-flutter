import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/user.dart';

class UserProvider extends ChangeNotifier {
  var _isLoading = false;
  User _user =
      User(id: '', name: '', phone: '', email: '', password: '', token: '');

  User get user => _user;

  void isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
