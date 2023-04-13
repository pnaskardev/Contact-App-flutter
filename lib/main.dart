import 'package:flutter/material.dart';
import 'package:ivykids_assignment/features/auth/screens/auth_screen.dart';
import 'package:ivykids_assignment/routes/routes.dart';
import 'package:ivykids_assignment/utils/global_vatiables.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IvyKids',
      theme: ThemeData(
        useMaterial3: true,
        ),
      onGenerateRoute: (settings)=>generateRoute(settings),
      home: const AutheScreen()
    );
  }
}
