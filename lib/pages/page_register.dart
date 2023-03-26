import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:test_youapp/network/api.dart';
import 'package:test_youapp/pages/Home/HomeScreen.dart';
import 'package:get/get.dart';

import 'package:test_youapp/utils/input_fields.dart';
import 'package:test_youapp/controller/RegisterController.dart';
import 'package:test_youapp/utils/submit_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController registerationController =
      Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151515),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 72),
          child: Column(
            children: [
              Card(
                elevation: 4.0,
                color: Colors.white10,
                margin: EdgeInsets.only(top: 86),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 18),
                        InputTextFieldWidget(registerationController.nameController, 'Name'),
                        SizedBox(height: 12),
                        InputTextFieldWidget(registerationController.emailController, 'Email'),
                        SizedBox(height: 12),
                        InputTextFieldWidget(registerationController.passwordController, 'Password'),
                        SizedBox(height: 12),
                        SubmitButton(
                          onPressed: () => registerationController.registerWithEmail(),
                          title: 'Register',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
