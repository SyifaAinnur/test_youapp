import 'package:get/get.dart';

import 'package:test_youapp/controller/AboutController.dart';


class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(
      () => AboutController(),
    );
  }
}