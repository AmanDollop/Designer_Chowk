import 'dart:convert';
import 'dart:io';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;

  String? token = '';
  final sd_name = "".obs;
  final sd_number = "".obs;
  final sd_email = "".obs;
  final image = Rxn<File?>();
  final user_Profile = "".obs;

  final phone = TextEditingController();
  final name = TextEditingController();
  final email = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getApi();
    getApiPost();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  http.MultipartFile getUserProfileImageFile() {
    return http.MultipartFile.fromBytes(
      'user_profile',
      image.value!.readAsBytesSync(),
      filename: image.value!.uri.pathSegments.last,
    );
  }

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
      sd_number.value = list["mobile"];
      sd_email.value = list["email"];
      user_Profile.value=list['user_profile'];
      print(sd_name.value);
      name.text = sd_name.value;
      print(name.text);
      email.text = sd_email.value;
      phone.text = sd_number.value;


    }
  }

  Future<void> getApiPost() async {
    http.Response res;
    if (image.value != null) {
      var request = http.MultipartRequest(
          "POST", Uri.parse(Constant.endPointUpdateUserProfile));
      request.fields['full_name'] = name.text;
      request.fields['email'] = email.text;
      request.headers['Authorization'] = token!;
      if(image.value!=null){
        request.files.add(getUserProfileImageFile());
      }
      http.StreamedResponse response = await request.send();
      res = await http.Response.fromStream(response);
    } else {
      res = await http.post(
        Uri.parse(Constant.endPointUpdateUserProfile),
        body: {
          "full_name": name.text,
          "email": email.text,
        },
        headers: {"Authorization": token!},
      );
    }
    print("message: === ${jsonDecode(res.body)}");
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
     // Toast.show("Record Updated Successfully");
      Get.back();
    }
  }

  void increment() => count.value++;

  getCamera() {
    openDialog();
  }

  void openDialog() {
    AlertDialog alert = AlertDialog(

      title: Text("Select Image".tr),
      content: Text("Choose image from the options below".tr),
      actions: [
        TextButton(
          onPressed: () {
                imagePic(ImageSource.camera);
                Get.back();
          },
            child: Text("CAMERA".tr),
        ),
        TextButton(
          onPressed: () {
            imagePic(ImageSource.gallery);
            Get.back();
          },
          child: Text("GALLERY".tr),
        ),
      ],
    );
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  imagePic(ImageSource imageSource) async {
    XFile? imagePick = await ImagePicker().pickImage(source: imageSource);
    if (imagePick != null) {
      image.value = File(imagePick.path);
      imageCroper();
    }
  }

  Future<void> imageCroper() async {
    final imageCropper = await ImageCropper().cropImage(
      sourcePath: image.value!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 40,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            // toolbarColor: const Color(0xff018067),
            //   toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            // activeControlsWidgetColor: Color(0xff018067),
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (imageCropper != null) {
      image.value = File(imageCropper.path);
    }
  }
}
