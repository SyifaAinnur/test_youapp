part of 'pages.dart';


abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const SUCCESS = _Paths.SUCCESS;
  static const FAILED = _Paths.FAILED;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const SUCCESS = '/success';
  static const FAILED = '/failed';
}