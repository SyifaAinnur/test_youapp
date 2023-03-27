import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_youapp/network/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:test_youapp/route/pages.dart';



class RegisterController extends GetxController {

  FocusNode emailFN = FocusNode();
  FocusNode nameFN = FocusNode();
  FocusNode passwordFN = FocusNode();
  FocusNode confirmPasswordFN = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool obscureTextpasswordController = true.obs;
  RxBool obscureTextconfirmPasswordController = true.obs;

  RxBool loading = false.obs;
  RxBool isButton = true.obs;
  RxBool passwordSame = false.obs;


  void checkButtonStatus() {
    if (

        ///
        emailController.text.isNotEmpty &&
            nameController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            confirmPasswordController.text.isNotEmpty

        ///
        ) {
      isButton.value = false;
    } else {
      isButton.value = true;
    }
  }

  void checkKesamaanPassword() {
    if (passwordController.text == confirmPasswordController.text) {
      passwordSame.value = true;
    } else {
      passwordSame.value = false;
    }
  }

  void registerButton() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        loading.value = true;
        var response = await http.post(
          Uri.parse("http://techtest.youapp.ai/api/register"),
          body: {
            "name": nameController.text,
            "email": emailController.text,
            "password": passwordController.text
          },
        );
        loading.value = false;
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
    } else {
      Get.defaultDialog(
        title: "Password tidak sama",
        middleText: "Password harus sama",
      );
    }
  }
}