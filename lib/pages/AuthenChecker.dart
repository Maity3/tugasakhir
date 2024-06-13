import 'package:flutter/material.dart';
import 'package:sobatternak_application/navbar/navigations_menu.dart';
import 'package:sobatternak_application/pages/login_screen.dart';

class AuthChecker extends StatelessWidget {
  final bool isLoggedIn;

  const AuthChecker({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return NavigationsBar();
    } else {
      return LoginScreen();
    }
  }
}
