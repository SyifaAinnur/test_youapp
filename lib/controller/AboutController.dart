import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_youapp/models/profile.dart';

class AboutController extends GetxController {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController horoscopeController = TextEditingController();
  TextEditingController zodiacController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  FocusNode displayNameF = FocusNode();
  FocusNode genderF = FocusNode();
  FocusNode birthdayF = FocusNode();
  FocusNode horoscopeF = FocusNode();
  FocusNode zodiacF = FocusNode();
  FocusNode heightF = FocusNode();
  FocusNode weightF = FocusNode();
  



  final profile = Rxn<Profile>();

  RxBool isButtonLogin = true.obs;


  void checkButtonStatus() {
    if (
      displayNameController.text.isEmpty &&
      genderController.text.isEmpty &&
      birthdayController.text.isEmpty &&
      horoscopeController.text.isEmpty &&
      zodiacController.text.isEmpty &&
      heightController.text.isEmpty &&
      weightController.text.isEmpty
    ) {
      isButtonLogin.value = false;
    } else {
      isButtonLogin.value = true;
    }
  }


  void fetchProfile() async {
    try {
      final response = await http.get(Uri.parse('http://techtest.youapp.ai/api/profile'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        profile.value = Profile(
          displayName: data['displayName'],
          gender: data['gender'],
          birthday: data['birthday'],
          horoscope: data['horoscope'],
          zodiac: data['zodiac'],
          height: data['height'].toDouble(),
          weight: data['weight'].toDouble(),
        );
      } else {
        throw Exception('Failed to fetch profile');
      }
    } catch (e) {
      print(e);
    }
  }

  void saveProfile() async {
    final profile = Profile(
      displayName: displayNameController.text,
      gender: genderController.text,
      birthday: birthdayController.text,
      horoscope: horoscopeController.text,
      zodiac: zodiacController.text,
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
    );

    // Here you can make a POST request to the API to save the profile data
    // For simplicity, this example just updates the profile state variable
    this.profile.value = profile;
  }

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  @override
  void onClose() {
    displayNameController.dispose();
    genderController.dispose();
    birthdayController.dispose();
    horoscopeController.dispose();
    zodiacController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.onClose();
  }
}

