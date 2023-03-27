import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_youapp/controller/LoginController.dart';
import 'package:test_youapp/pages/theme/widgets.dart';
import 'package:test_youapp/route/pages.dart';

final LoginController loginController = Get.put(LoginController());

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void initState() {
    super.initState();
    loginController.emailController.addListener(updateButton);
    loginController.passwordController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      loginController.checkButtonStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: () {
        loginController.emailLoginF.unfocus();
        loginController.passwordLoginF.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {
                print("Back button pressed");
                Get.back();
              },
              icon: Icon(CupertinoIcons.back),
            ),
          ),
          title: Text(
            'Back',
            style: TextStyle(),
          ),
        ),
        body: Container(
          decoration: Background(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 41),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: TextFormField(
                    focusNode: controller.emailLoginF,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Username/Email',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 51,
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Obx(
                    () => TextFormField(
                      focusNode: controller.passwordLoginF,
                      autocorrect: false,
                      controller: controller.passwordController,
                      obscureText: controller.obscureTextLogin.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              controller.obscureTextLogin.value =
                                  !controller.obscureTextLogin.value;
                            },
                            child: Icon(
                                controller.obscureTextLogin.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white),
                          ),
                        ),
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ButtonLogin(),
                SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: Text(
                        "Register here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.amber.shade200,
                          fontSize: 14.5,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
