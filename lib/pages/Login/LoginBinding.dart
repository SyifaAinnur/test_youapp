import 'package:get/get.dart';
import 'package:test_youapp/controller/LoginController.dart';



class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
