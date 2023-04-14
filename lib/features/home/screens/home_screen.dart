import 'package:flutter/material.dart';
import 'package:ivykids_assignment/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(user.name),
        ),
      ),
    );
  }
}
