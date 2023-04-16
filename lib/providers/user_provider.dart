// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ivykids_assignment/model/contact.dart';
import 'package:ivykids_assignment/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:ivykids_assignment/utils/error-handling.dart';
import 'package:ivykids_assignment/utils/global_vatiables.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserProvider extends ChangeNotifier {
  var isLoading = false;

  List<Contacts>list =[];
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
    try 
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);

      http.Response res = await http.get(
        Uri.parse('$uri/contacts/get-contacts?id=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        });
    List<Contacts> tempList = (json.decode(res.body) as List)
        .map((data) => Contacts.fromJson(data))
        .toList();

    _user.contacts = tempList;
    notifyListeners();  
    } catch (e) {
        log(e.toString());
    }
  }

  Future<void> addContact(String name, String phone, String email, String id,
      BuildContext context) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);

      final Contacts contact = Contacts(name: name, phone: phone, email: email);
      http.Response res = await http.post(
          Uri.parse('$uri/contacts/add-contact?userId=$id'),
          body: jsonEncode(contact.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          });
      if (res.statusCode == 201) {
      }
      log(res.statusCode.toString());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
             setUser(res.body);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact has been added',),backgroundColor: Colors.green,));
          });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteContact(
      String userId, String contactId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);

      http.Response res = await http.delete(
          Uri.parse(
              '$uri/contacts/delete-contact?userId=$userId&contactId=$contactId'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          });
      log(res.body);
      log(res.statusCode.toString());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            setUser(res.body);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact has been deleted'),backgroundColor: Colors.green,));
          });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateContact(
      String userId, String contactId,String name,String email,String phone,BuildContext context) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('x-auth-token') ?? '';
      prefs.setString('x-auth-token', token);

      http.Response res = await http.patch(
          Uri.parse(
              '$uri/contacts/edit-contact?userId=$userId&contactId=$contactId'),
              body: json.encode({'name': name, 'phone': phone, 'email': email}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          });
      log(res.body);
      log(res.statusCode.toString());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            setUser(res.body);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact has been updated'),backgroundColor: Colors.green,));
          });
    } catch (e) {
      log(e.toString());
    }
  }
}
