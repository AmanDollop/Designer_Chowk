import 'dart:convert';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../ApiData/blog_detail_data.dart';

class PostDetailController extends GetxController {
  final comment = TextEditingController();

  final count = 0.obs;
  var data = Rxn<BlogDataOne>();
  final dataone = <Comments>[].obs;
  String? token = "";
  final isPressed = Rxn();
  var reqiredParams = {
    "blog_id": Get.arguments[0],
    'language': "en",
  };

  @override
  void onInit() {
    super.onInit();
    getBlogDetail();
    //postLick();
    //likeDisLike();
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

  getBlogDetail() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    var uri =
        Uri.http("dgnchowk.dollopinfotech.com", "getBlogDetail", reqiredParams);
    http.Response res = await http.get(
      uri,
      headers: {"Authorization": token!},
    );

    //print(res.body);
    if (res.statusCode == 200) {
      Blog_Details_Data blog_details_data =
          Blog_Details_Data.fromJson(jsonDecode(res.body));
      if (blog_details_data.blogData != null) {
        data.value = blog_details_data.blogData;
        if (blog_details_data.blogData!.comments != null) {
          dataone.value = blog_details_data.blogData!.comments!;
        }
      }
    }
  }

  postComments() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    http.Response res = await http.post(
        Uri.parse(Constant.endPointBlogcomments),
        body: {"blog_id": Get.arguments[0], "comment": comment.text},
        headers: {"Authorization": token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      //print(map['massage']);
      comment.text = '';
    }
  }

  postLick() async {
    var sd = await SharedPreferences.getInstance();
    token = sd.getString("token");
    http.Response res = await http.post(
        Uri.parse(Constant.endPointUserBloglikes),
        body: {"blog_id": Get.arguments[0]},
        headers: {"Authorization": token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      //print(map["asnjkdnjksndkndknkcdndjk"]);
    }
  }

/*  likeDisLike() {
    if (isPressed != true) {
      return Get.back(result: isPressed == false);
    } else {
      return Get.back(result: isPressed == true);
    }
  }*/

  clickLikeButton() {
    isPressed.value = data.value?.isLikes;
    if (isPressed.value == '0') {
      isPressed.value = '1';
      postLick();
    } else {
      isPressed.value = '0';
      postLick();
    }
    data.value!.isLikes = isPressed.value;
    print(data.value!.isLikes);
  }
}
