import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/contact.dart';
import 'package:ivykids_assignment/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:ivykids_assignment/utils/error-handling.dart';
import 'package:ivykids_assignment/utils/global_vatiables.dart';
import 'package:ivykids_assignment/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  var isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  User _user = User(
      id: '',
      name: '',
      phone: '',
      email: '',
      password: '',
      token: '',
      contacts: []);

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  Future<void> updateList(String id) async {
    http.Response res = await http.get(
        Uri.parse('$uri/contacts/get-contacts?id=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    print(res.body);
    List<Contacts> tempList = (json.decode(res.body) as List)
        .map((data) => Contacts.fromJson(data))
        .toList();

    _user.contacts = tempList;
    notifyListeners();
  }

  Future<void> addContact(
      String name, String phone, String email, String id) async {
    try {
      final Contacts contact = Contacts(name: name, phone: phone, email: email);
      http.Response res = await http.post(
          Uri.parse('$uri/contacts/add-contact?id=$id'),
          // body: user.toJson(),
          body: jsonEncode(contact.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteContact(String userId, String contactId) async {
    try {
      http.Response res = await http.delete(
          Uri.parse(
              '$uri/contacts/delete-contact?userId=$userId&contactId=$contactId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
    } catch (e) {
      log(e.toString());
    }
  }
}
