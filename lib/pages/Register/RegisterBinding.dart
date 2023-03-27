import 'package:get/get.dart';
import 'package:test_youapp/controller/RegisterController.dart';



class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
