import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_youapp/controller/LoginController.dart';
import 'package:test_youapp/controller/RegisterController.dart';



final LoginController controller = Get.put(LoginController());
final RegisterController regC = Get.put(RegisterController());

BoxDecoration Background() {
  return BoxDecoration(
    gradient: RadialGradient(
      center: Alignment.topRight,
      radius: 1.5173,
      colors: [
        Color.fromARGB(255, 35, 99, 108),
        Color.fromARGB(255, 25, 52, 61),
        Color(0xFF09141A),
      ],
      stops: [0, 0.5618, 1],
    ),
  );
}

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: controller.isButtonLogin.isTrue
                ? [
                    Color.fromARGB(255, 99, 234, 232),
                    Color(0xFF62CDCB),
                    Color.fromARGB(255, 70, 170, 247),
                    Color(0xFF4599DB),
                  ].map((color) {
                    final darkerColor = Color.fromRGBO(
                      (color.red * 0.6).round(),
                      (color.green * 0.6).round(),
                      (color.blue * 0.6).round(),
                      1,
                    );
                    return darkerColor;
                  }).toList()
                : [
                    Color.fromARGB(255, 99, 234, 232),
                    Color(0xFF62CDCB),
                    Color.fromARGB(255, 70, 170, 247),
                    Color(0xFF4599DB),
                  ],
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: controller.isButtonLogin.isTrue
              ? null
              : [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 7,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  ),
                ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size(Get.width - 44, 48)),
          onPressed: controller.isButtonLogin.isTrue
              ? null
              : () {
                  /// login
                  controller.loginButton();
                },
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color:
                  controller.isButtonLogin.isTrue ? Colors.grey : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: regC.isButton.isTrue
                ? [
                    Color.fromARGB(255, 99, 234, 232),
                    Color(0xFF62CDCB),
                    Color.fromARGB(255, 70, 170, 247),
                    Color(0xFF4599DB),
                  ].map((color) {
                    final darkerColor = Color.fromRGBO(
                      (color.red * 0.6).round(),
                      (color.green * 0.6).round(),
                      (color.blue * 0.6).round(),
                      1,
                    );
                    return darkerColor;
                  }).toList()
                : [
                    Color.fromARGB(255, 99, 234, 232),
                    Color(0xFF62CDCB),
                    Color.fromARGB(255, 70, 170, 247),
                    Color(0xFF4599DB),
                  ],
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: regC.isButton.isTrue
              ? null
              : [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 7,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  ),
                ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size(Get.width - 44, 48)),
          onPressed: regC.isButton.isTrue
              ? null
              : () {
                  /// register
                  regC.registerButton();
                },
          child: Text(
            regC.passwordSame.isTrue
                ? "Register"
                : "Passwords are not the same",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: regC.isButton.isTrue ? Colors.grey : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
