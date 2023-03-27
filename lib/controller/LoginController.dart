import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_youapp/route/pages.dart';


class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailLoginF = FocusNode();
  FocusNode passwordLoginF = FocusNode();

  RxBool obscureTextLogin = true.obs;
  RxBool loadingLogin = false.obs;
  RxBool isButtonLogin = true.obs;

  void checkButtonStatus() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }

  void loginButton() async {
    loadingLogin.value = true;
    try {
      var response = await http.get(
        Uri.parse(
            "http://techtest.youapp.ai/api/login?email=${emailController.text}&password=${passwordController.text}"),
        // body: {"email": emailLogin.text, "password": passwordLogin.text},
      );
      loadingLogin.value = false;
      Map<String, dynamic> logdata =
          jsonDecode(response.body) as Map<String, dynamic>;

      if (logdata['message'] == "success") {
        Get.offAllNamed(Routes.HOME);
      } else if (logdata['message'] != "success") {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "${logdata['message']}",
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Login gagal",
        middleText: "Periksa koneksi internet",
      );
    }
  }
}

