import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  String? name ;

  @override
  void onInit() {
    super.onInit();
    print('OnInit');
    getActivity();
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

  Future<void> getActivity() async {
    var sd = await SharedPreferences.getInstance();
    name = sd.getString("name");
    if (name == null||name=="") {
     await Future.delayed(Duration(seconds: 3));
      Get.offNamed(Routes.SIGN_IN);
    } else {
      print('jsfgsydfgaghfsdfzfdgfghzfdy');
     await Future.delayed(Duration(seconds: 3));
      Get.offNamed(Routes.HOME);
    }
  }
}
