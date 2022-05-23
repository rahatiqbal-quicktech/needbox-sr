import 'dart:async';

import 'package:flutter/material.dart';
import 'package:needbox_sr/features/dashboard/dashboard_screen.dart';
import 'package:needbox_sr/utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        appLogo,
        height: 160,
      ),
    );
  }
}
