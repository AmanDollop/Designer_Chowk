import 'dart:io';

import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  final Fromkey = GlobalKey<FormState>();

  ImageProvider showProfilePic() {
    if (controller.image.value != null) {
      return FileImage(File(controller.image.value!.path));
    }
    if (controller.user_Profile.isNotEmpty) {
      return NetworkImage(Constant.baseUri + controller.user_Profile.value);
    }
    return const AssetImage("images/mask_group.png");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Profile'.tr,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 0.4,
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: ListView(
          children: [
            SizedBox(height: size.height * 0.026),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
              child: Form(
                key: Fromkey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 125,
                          width: 125,
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
                        IconButton(
                          onPressed: () => controller.getCamera(),
                          icon: Icon(
                            Icons.camera_alt,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.014),
                    Text(
                      "${controller.sd_name.value}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: size.width * 0.009),
                    Text(
                      controller.sd_email.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontSize: 12),
                    ),
                    SizedBox(height: size.width * 0.07),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 14),
                        ),
                        TextField(
                          controller: controller.name,
                          style: Theme.of(context).textTheme.bodyText2,
                          decoration: InputDecoration(
                            hintText: "Enter name",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: size.width * 0.064),
                        Text(
                          "User Email".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 14),
                        ),
                        SizedBox(height: size.height * 0.0112),
                        TextField(
                          controller: controller.email,
                          style: Theme.of(context).textTheme.bodyText2,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: size.width * 0.064),
                        Text(
                          "Mobile Number".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 14),
                        ),
                        SizedBox(height: size.height * 0.008),
                        TextField(
                          controller: controller.phone,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "+91 ${controller.sd_number.value}",
                            contentPadding: EdgeInsets.only(top: 20),
                            counterText: "",
                            hintStyle: Theme.of(context).textTheme.bodyText2,
                            suffixIcon: Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Icon(
                                Icons.verified_rounded,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.17),
                        ElevatedButton(
                          onPressed: () {
                            controller.getApiPost();
                            controller.getApi();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 52)),
                          child: Text(
                            "Save Profile".tr,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
