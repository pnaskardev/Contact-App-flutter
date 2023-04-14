import 'package:flutter/material.dart';
import 'package:ivykids_assignment/features/auth/screens/auth_screen.dart';
import 'package:ivykids_assignment/features/auth/services/auth_service.dart';
import 'package:ivykids_assignment/features/home/screens/home_screen.dart';
import 'package:ivykids_assignment/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> 
{
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Provider.of<UserProvider>(context,listen: false).user.token.isNotEmpty 
          ? const HomeScreen()
          :const  AutheScreen();
  }
}