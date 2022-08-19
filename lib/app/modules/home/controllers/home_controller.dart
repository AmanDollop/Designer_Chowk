import 'dart:convert';
import 'dart:io';
import 'package:designer_chock/ApiData/blog_data.dart';
import 'package:designer_chock/ApiData/category_data.dart';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isIndore = "Indore".tr.obs;

  final blog_image = "".obs;
  final blog_title = "".obs;
  final blog_description = "".obs;

  List<Blog> data = [];
  List<Category> dataone = [];

  /* var dataOne = Rxn();
  final isPressed = Rxn();*/
  String? token = "";
  final image = Rxn<File?>();
  final user_Profile = "".obs;

  final List<Tab> myTabs = <Tab>[].obs;

  late TabController controller;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getApi();
    getCategoryData();
    controller = TabController(
      vsync: this,
      length: 6,
    );
    getBolgData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeCity(String value) => isIndore.value = value;

  void increment(String value) => count.value++;

  Future<void> getApi() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    print(token);
    http.Response res = await http.get(
        Uri.parse(Constant.endPointGetUserProfile),
        headers: {"Authorization": token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Map<String, dynamic> list = map["user_profile"];
      user_Profile.value = list['user_profile'];
    }
  }

  void getReflect() async {
    await Get.toNamed(Routes.PROFILE_VIEW);
    getApi();
  }

  Future<void> getBolgData() async {
    http.Response res = await http.get(
      Uri.parse(Constant.endPointGetblog),
    );

    if (res.statusCode == 200) {
      BlogData blogData = BlogData.fromJson(jsonDecode(res.body));
      if (blogData.blog != null) {
        data = blogData.blog!;
      }
    }
  }

  getCategoryData() async {
    http.Response res = await http.get(
      Uri.parse(Constant.endPointGetCategory),
    );
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      CategoryData categoryData = CategoryData.fromJson(jsonDecode(res.body));
      if (categoryData.category != null) {
        categoryData.category!.forEach((element) {
          Tab tab = Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  Constant.baseUri + element.categoryImage.toString(),height: 10,width: 10,
                ),
                const SizedBox(
                  width: 1,
                ),
                Text(
                  element.categoryName!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: "GilroyMedium",
                  ),
                ),
              ],
            ),
          );

          myTabs.add(tab);
        });
      } else {
        print("Error");
      }
    }
  }
}
