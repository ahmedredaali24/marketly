import 'dart:async';


import 'package:flutter/material.dart';

import '../auth/login_screen/login_screen.dart';
import '../home/home_screen/home_screen_view.dart';
import '../utils/shared_pre.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      var token = SharedPre.getDate(key: "Toke");
      if (token != null && token is String && token.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed(HomeScreenView.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/logo_e1.png",
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
