import 'package:flutter/material.dart';
// import 'package:test_youapp/pages/Home/HomeScreen.dart';
import 'package:test_youapp/pages/Login/page_login.dart';
import 'package:test_youapp/pages/page_onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:test_youapp/pages/theme/theme.dart';
import 'package:test_youapp/route/pages.dart';

main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeYouApp(),
    initialRoute: Pages.INITIAL,
    getPages: Pages.routes,
  ));
}

