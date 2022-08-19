import 'dart:convert';
import 'dart:io';

import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../data/Comman/comman_uri.dart';

class ProfileViewController extends GetxController {
  //TODO: Implement ProfileViewController

  final count = 0.obs;
  final isEN = 'en'.obs;

  final isLocation = 'Indore'.obs;
  final notificationOn = false.obs;
  final sd_name = "".obs;
  final sd_email = "".obs;
  final sd_phone = "".obs;
  String? token = "";
  final image = Rxn<File?>();
  final user_Profile = "".obs;

  @override
  void onInit() {
    super.onInit();
    getApi();
    likeDisLike();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment(String value) => isEN.value = value;

  void increment1(String value) => isLocation.value = value;

  Future<void> getApi() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    http.Response res = await http.get(
        Uri.parse(Constant.endPointGetUserProfile),
        headers: {"Authorization": token!});
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      Map<String, dynamic> list = map["user_profile"];
      sd_name.value = list["full_name"];
      sd_email.value = list["email"];
      sd_phone.value = list["mobile"];
      user_Profile.value = list['user_profile'];
    }
  }

  void getReflect() async {
    await Get.toNamed(Routes.EDIT_PROFILE);
    getApi();
  }

 /* Future<void> notification() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    http.Response res = await http
        .post(Uri.parse(Constant.endPointUserNotificationSetting), body: {
      "notification": notificationOn,
    }, headers: {
      "Authorization": token!
    });
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      notificationOn;
    }
  }*/

  likeDisLike() {
    if (notificationOn != true) {
      return Get.back(result: notificationOn == false);
    } else {
      return Get.back(result: notificationOn == true);
    }
  }
}
