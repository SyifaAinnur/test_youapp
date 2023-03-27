import 'package:get/get.dart';
import 'package:test_youapp/pages/Home/HomeScreen.dart';
import 'package:test_youapp/pages/Home/HomeBinding.dart';
import 'package:test_youapp/pages/Login/LoginBinding.dart';
import 'package:test_youapp/pages/Login/page_login.dart';
import 'package:test_youapp/pages/Register/RegisterBinding.dart';
import 'package:test_youapp/pages/Register/page_register.dart';

part 'route.dart';

class Pages {
  Pages._();

  static const INITIAL = _Paths.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
        GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
        GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
        GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];




}