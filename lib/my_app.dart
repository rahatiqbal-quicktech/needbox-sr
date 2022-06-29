import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/login/login_screen.dart';
import 'package:needbox_sr/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: LoginScreen(),
    );
  }
}
