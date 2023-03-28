import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:test_youapp/models/SingletonModel.dart';
import 'package:test_youapp/models/interest.dart';

class AddInterestScreen extends StatefulWidget {
  const AddInterestScreen({super.key});

  @override
  State<AddInterestScreen> createState() => _AddInterestScreenState();
}

class _AddInterestScreenState extends State<AddInterestScreen> {
  List<String>? values;
  late SingletonModel _model;
  late bool _onSave;

  @override
  void initState() {
    super.initState();
    _model = SingletonModel.shared;
    _onSave = false;
    values = [];
  }

  void _onSaving() async {
    if (!_onSave) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _onSave = true;
        _model.interest = values;
      });
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xFF1F4247), Color(0xFF0D1D23)],
                center: Alignment.topRight,
                radius: 1)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tell everyone about yourself',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD5BE88)),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'What interest you?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              FlutterInputChips(
                maxChips: 5,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8)),
                initialValue: const [],
                onChanged: (v) {
                  setState(() {
                    values = v;
                  });
                },
                padding: const EdgeInsets.all(10),
                inputDecoration: const InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  hintText: "Enter text here",
                ),
                chipTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                chipSpacing: 8,
                chipDeleteIcon: const Icon(CupertinoIcons.clear),
                chipDeleteIconColor: Colors.white,
                chipBackgroundColor: Colors.blueGrey,
              ),
              const SizedBox(
                height: 16,
              ),
              _onSave
                  ? SpinKitCircle(
                      color: Color(0xFFABFFFD),
                      size: 14,
                    )
                  : InkWell(
                      onTap: () => _onSaving(),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Color(0xFFABFFFD)),
                      ),
                    ),
              const SizedBox(
                height: 16,
              ),
              // Display saved interests
            ],
          ),
        ),
      ),
    );
  }
}
