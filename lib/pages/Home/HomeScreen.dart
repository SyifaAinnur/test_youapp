import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:get/get.dart';
import 'package:test_youapp/pages/About/AboutScreen.dart';
import 'package:test_youapp/pages/Interest/InterestScreen.dart';
import 'package:test_youapp/models/SingletonModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SingletonModel _model;

  void initState() {
    super.initState();
    _model = SingletonModel.withContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: const [
                    Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ]),
                  Text(
                    // _model.user!.data!.email!,
                    'email',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const Icon(
                    CupertinoIcons.person,
                    color: Colors.white,
                  )
                ],
              )))),
      backgroundColor: Color(0x09141A),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * .25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0x09141A)),
                      child: Center(
                          child: Text(
                        "@email",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 32, top: 8, right: 8, bottom: 16),
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => Get.to(const AboutScren()),
                      child: const Icon(
                        CupertinoIcons.pencil,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Add in your your to help others know you better",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 32, top: 8, right: 8, bottom: 16),
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withOpacity(0.1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Interest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => Get.to(const AddInterestScreen()),
                      child: const Icon(
                        CupertinoIcons.pencil,
                        size: 24,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                _model.interest == null
                    ? Text(
                        "Add in your interest to find a better match",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontSize: 14,
                        ),
                      )
                    : IgnorePointer(
                        ignoring: true,
                        child: FlutterInputChips(
                          maxChips: 5,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          initialValue: _model.interest ?? [],
                          onChanged: (v) {},
                          padding: const EdgeInsets.all(10),
                          inputDecoration: const InputDecoration(
                            filled: false,
                            border: InputBorder.none,
                          ),
                          chipTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          chipSpacing: 8,
                          chipCanDelete: false,
                          chipBackgroundColor: Colors.blueGrey,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
