import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_youapp/controller/AboutController.dart';
import 'package:test_youapp/pages/theme/widgets.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:test_youapp/tools/horoscope.dart';
import 'package:test_youapp/tools/zodiac.dart';
import 'package:intl/intl.dart';

final AboutController aboutController = Get.put(AboutController());

class AboutScren extends StatefulWidget {
  const AboutScren({super.key});

  @override
  State<AboutScren> createState() => _AboutScrenState();
}

class _AboutScrenState extends State<AboutScren> {
  DateTime? _date;
  DateFormat? _format;
  late String _horoscope;
  late String _shio;
  String? _cGender;

  void initState() {
    super.initState();
    aboutController.displayNameController.addListener(updateButton);
    aboutController.genderController.addListener(updateButton);
    aboutController.birthdayController.addListener(updateButton);
    aboutController.horoscopeController.addListener(updateButton);
    aboutController.zodiacController.addListener(updateButton);
    aboutController.heightController.addListener(updateButton);
    aboutController.weightController.addListener(updateButton);

    _format = DateFormat('dd MMMM yyyy');
    _date = DateTime.now();
    _shio = "--";
    _horoscope = "--";
  }

  void updateButton() {
    setState(() {
      aboutController.checkButtonStatus();
    });
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
                  Row(
                    children: const [
                      Text(
                        "About",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save & Update",
                      style: TextStyle(
                        // color: HexColor("D1B000"),
                        color: Color(0xFFD1B000),
                        fontSize: 14,
                        
                      ),

                    ),
                    )
                ]),
          ),
        ),
      ),
      backgroundColor: Color(0xff0E191F),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(children: [
        Container(
          padding:
              const EdgeInsets.only(left: 32, top: 8, right: 8, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        // onTap: () => _getImageGallery(),
                        onTap: () => {},
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.3),
                                borderRadius: BorderRadius.circular(8)),
                            // child: _image == null
                            //     ?
                            child: Icon(
                              CupertinoIcons.plus,
                              // color: HexColor("D1B000"))
                              color: Color(0xFFD1B000),
                            )
                            // : Image.file(
                            //     _image ?? File(""),
                            //     fit: BoxFit.fill,
                            //   ),
                            ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      // _image == null
                      //     ? const
                      Text(
                        "Add image",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                      // : const Text(
                      //     "Image added",
                      //     style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.white),
                      //   )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Display name:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              controller: aboutController.displayNameController,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                hintText: "Enter name",
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.3),
                                    fontSize: 14),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Gender:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              // dropdownColor: HexColor("09141A"),
                              dropdownColor: Color(0xff09141A),

                              style: const TextStyle(color: Colors.white),
                              icon: const Icon(CupertinoIcons.chevron_down),
                              isExpanded: true,
                              value: _cGender,
                              items: <String>[
                                'Male',
                                'Female'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width: 130,
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                );
                              }).toList(),
                              // Step 5.
                              onChanged: (String? newValue) {
                                setState(() {
                                  _cGender = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Birthday:",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.3),
                                fontSize: 14),
                          ),
                        ),
                        Expanded(
                            flex: 6,
                            child: Container(
                              height: 50,
                              child: TextFormField(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext builder) {
                                        return SizedBox(
                                          height: 250,
                                          child: ScrollDatePicker(
                                            minimumDate: DateTime(1945),
                                            maximumDate: DateTime.now(),
                                            selectedDate: _date!,
                                            locale: const Locale('en'),
                                            onDateTimeChanged: (DateTime value) {
                                              setState(() {
                                                _date = value;
                                                aboutController
                                                        .birthdayController.text =
                                                    _format!.format(_date!);
                                              });
                                              if (_date != null) {
                                                setState(() {
                                                  _horoscope = Zodiac().getZodiac(
                                                      _date.toString())!;
                                                  _shio = Shio()
                                                      .getShio(_date.toString())!;
                                                });
                                              }
                                            },
                                          ),
                                        );
                                      });
                                },
                                controller: aboutController.birthdayController,
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),
                                  hintText: "DD MM YYYY",
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(.3),
                                      fontSize: 14),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Zodiac:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.2)),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    _horoscope,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Horoscope:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(0.2)),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    _shio,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Height:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: aboutController.heightController,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                hintText: "Add height",
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.3),
                                    fontSize: 14),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Weight:",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.3),
                              fontSize: 14),
                        ),
                      ),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: aboutController.weightController,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                hintText: "Add weight",
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(.3),
                                    fontSize: 14),
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
