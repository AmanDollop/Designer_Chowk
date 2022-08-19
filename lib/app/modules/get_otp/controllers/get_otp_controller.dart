import 'package:get/get.dart';

class GetOtpController extends GetxController {
  //TODO: Implement GetOtpController

  final count = 0.obs;
  final phone=Get.arguments[0] as String;
  int otp=Get.arguments[1] as dynamic;
  final name=Get.arguments[2] as String;
  @override
  void onInit() {
    super.onInit();
    print("otp::::::::::${otp}");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
