import 'package:flutter/material.dart';
import 'package:ivykids_assignment/features/auth/screens/auth_screen.dart';
import 'package:ivykids_assignment/features/auth/screens/signin_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AutheScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AutheScreen());
    case SignInScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignInScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist '),
                ),
              ));
  }
}
