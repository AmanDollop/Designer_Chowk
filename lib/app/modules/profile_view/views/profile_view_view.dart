import 'dart:io';

import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/data/sheets/bottom_sheet_language.dart';
import 'package:designer_chock/app/data/sheets/bottom_sheet_location.dart';
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/profile_view_controller.dart';

class ProfileViewView extends GetView<ProfileViewController> {
  ProfileViewView({Key? key}) : super(key: key);
  ImageProvider showProfilePic() {
    if (controller.image.value != null) {
      return FileImage(File(controller.image.value!.path));
    }
    if (controller.user_Profile.isNotEmpty) {
      return NetworkImage(Constant.baseUri + controller.user_Profile.value);
    }
    return const AssetImage("images/mask_group.png");
  }


  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("${size.height * 0.04}");
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title:
              Text('Profile'.tr, style: Theme.of(context).textTheme.bodyText2),
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  icon: const Icon(Icons.notifications_none),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.014,
                      vertical: size.height * 0.014),
                  child: Container(
                    height: size.height * 0.0154,
                    width: size.width * 0.035,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary),
                    child: const Center(
                        child: Text(
                      "2",
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: (){
                    controller.getReflect();
                  },
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  leading:  Container(
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1),
                      image: DecorationImage(
                        image: showProfilePic(),
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            "${controller.sd_name.value}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        Text(
                          "${controller.sd_email.value}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Icon(Icons.mode_edit_outline_outlined,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.042,
                      vertical: size.height * 0.016),
                  child: Text(
                    "General".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                ),
                ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  title: Text(
                    "Mobile Number".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                  subtitle: Obx(
                    () => Text(
                      "+91 ${controller.sd_phone.value}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.042,
                      vertical: size.height * 0.016),
                  child: Text(
                    "Account".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                ),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: size.height * 0.4,
                          width: double.infinity,
                          child: Obx(
                            () => ListView(
                              children: [
                                SizedBox(
                                  height: size.height * 0.4,
                                  width: double.infinity,
                                  child: SelectedLanguagePage(
                                    isEn: controller.isEN.value,
                                    changeLanguage: (String value) {
                                      controller.increment(value);
                                    },
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  leading: Container(
                    width: size.width * 0.089,
                    height: size.height * 0.041,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                        child: Image(
                            image: const AssetImage("images/edit.png"),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                            width: size.width * 0.04,
                            height: size.height * 0.01786)),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Create Blog".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 14, fontFamily: "GilroyMedium"),
                        ),
                        Text(
                          "Send a request to admin to create a blog".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: size.height * 0.45,
                          width: double.infinity,
                          child: Obx(
                            () => ListView(
                              children: [
                                SizedBox(
                                  height: size.height * 0.43,
                                  width: double.infinity,
                                  child: SelectedLocationPage(
                                    isLocation: controller.isLocation.value,
                                    changeLocation: (String value) {
                                      controller.increment1(value);
                                    },
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  leading: Container(
                    width: size.width * 0.089,
                    height: size.height * 0.041,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                        child: Image(
                            image: const AssetImage("images/picture.png"),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                            width: size.width * 0.04,
                            height: size.height * 0.01786)),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My Posts".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 14, fontFamily: "GilroyMedium"),
                        ),
                        Text(
                          "Send a request to admin to create a blog".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.042,
                      vertical: size.height * 0.016),
                  child: Text(
                    "Settings",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                ),
                ListTile(
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  leading: Container(
                    width: size.width * 0.089,
                    height: size.height * 0.041,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Notification".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontSize: 14, fontFamily: "GilroyMedium"),
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: CupertinoSwitch(
                      activeColor: Theme.of(context).colorScheme.secondary,
                      value: controller.notificationOn.value,
                      onChanged: (value) {
                        controller.notificationOn.value = value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                InkWell(
                  onTap: () {
                    AlertDialog alert = AlertDialog(
                      title: Text("Designer Chowk".tr),
                      content: Text("Are you sure you want to Sign out ?".tr),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("CANCEL".tr),
                        ),
                        TextButton(
                          onPressed: () async {
                            var sd = await SharedPreferences.getInstance();
                            sd.setString("name", "");
                            Get.offAllNamed(Routes.SIGN_IN);
                          },
                          child: Text("LOGOUT".tr),
                        ),
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.onPrimary,
                    leading: Text("Sign out your account".tr,
                        style: Theme.of(context).textTheme.bodyText1),
                    trailing: Image(
                        image: const AssetImage("images/sign-out-alt.png"),
                        width: size.height * 0.023,
                        height: size.height * 0.023),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
