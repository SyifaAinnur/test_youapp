
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_youapp/pages/theme/widgets.dart';
import 'package:test_youapp/controller/RegisterController.dart';
import 'package:test_youapp/route/pages.dart';

final RegisterController registerationController =
    Get.put(RegisterController());

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  void initState() {
    super.initState();
    registerationController.nameController.addListener(updateButton);
    registerationController.emailController.addListener(updateButton);
    registerationController.passwordController.addListener(updateButton);
    registerationController.confirmPasswordController
        .addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      registerationController.checkButtonStatus();
      registerationController.checkKesamaanPassword();
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        registerationController.nameFN.unfocus();
        registerationController.emailFN.unfocus();
        registerationController.passwordFN.unfocus();
        registerationController.passwordFN.unfocus();
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
              icon: Icon(
                CupertinoIcons.back,
              ),
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
                    "Register",
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
                    focusNode: registerationController.emailFN,
                    controller: registerationController.emailController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Create Email',
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
                  child: TextFormField(
                    focusNode: registerationController.nameFN,
                    controller: registerationController.nameController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Create Username',
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
                      focusNode: registerationController.passwordFN,
                      controller: registerationController.passwordController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      obscureText: registerationController.obscureTextpasswordController.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              registerationController.obscureTextpasswordController.value =
                                  !registerationController.obscureTextpasswordController.value;
                            },
                            child: Icon(
                                registerationController.obscureTextpasswordController.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white),
                          ),
                        ),
                        hintText: 'Create Password',
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
                      focusNode: registerationController.confirmPasswordFN,
                      controller: registerationController.confirmPasswordController,
                      autocorrect: false,
                      obscureText:
                          registerationController.obscureTextconfirmPasswordController.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: GestureDetector(
                            onTap: () {
                              registerationController.obscureTextconfirmPasswordController
                                      .value =
                                  !registerationController
                                      .obscureTextconfirmPasswordController.value;
                            },
                            child: Icon(
                                registerationController.obscureTextconfirmPasswordController
                                        .value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white),
                          ),
                        ),
                        hintText: 'Confirm Password',
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
                ButtonRegister(),
                SizedBox(height: 52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: Text(
                        "Login here",
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
