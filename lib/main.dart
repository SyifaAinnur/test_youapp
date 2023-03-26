import 'package:flutter/material.dart';
// import 'package:test_youapp/pages/Home/HomeScreen.dart';
import 'package:test_youapp/pages/page_login.dart';
import 'package:test_youapp/pages/page_onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

