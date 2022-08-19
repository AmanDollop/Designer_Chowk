import 'dart:convert';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/data/views/validator_comman_pagge.dart';
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import '../controllers/sign_in_controller.dart';
import 'package:http/http.dart' as http;

class SignInView extends GetView<SignInController> {
  final Formkey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final name = TextEditingController();
  SignInView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
            child: Form(
              key: Formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                            image: const AssetImage(
                              "images/designer-chowk-logo_eng.png",
                            ),
                            height: size.height * 0.08),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text("Sign In".tr,
                      style: Theme.of(context).textTheme.headline1),
                  Divider(
                      endIndent: size.width * 0.83,
                      color: Colors.red,
                      thickness: 3,
                      height: size.height * 0.015),
                  SizedBox(height: size.height * 0.005),
                  Text("Enter phone number".tr,
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: size.height * 0.06),
                  TextFormField(
                    controller: name,
                    validator: (value) =>
                        validatorpage.validationName(name: value),
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        height: size.height * 0.02,
                        width: size.width * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.person, size: 20),
                            SizedBox(width: size.width * 0.04),
                            SizedBox(
                              height: size.height * 0.04,
                              child: const VerticalDivider(
                                  width: 1, endIndent: 2, color: Colors.grey),
                            ),
                            SizedBox(width: size.width * 0.05),
                          ],
                        ),
                      ),
                      hintText: "Enter your name".tr,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  TextFormField(
                    controller: phone,
                    validator: (value) =>
                        validatorpage.validationMobile(Phone: value),
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        height: size.height * 0.02,
                        width: size.width * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.phone_android_rounded, size: 20),
                            SizedBox(width: size.width * 0.04),
                            SizedBox(
                              height: size.height * 0.04,
                              child: const VerticalDivider(
                                  width: 1, endIndent: 2, color: Colors.grey),
                            ),
                            SizedBox(width: size.width * 0.05),
                          ],
                        ),
                      ),
                      hintText: "Enter your number".tr,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  SizedBox(height: size.height * 0.019),
                  Text(
                      "4 digit OTP will be sent via SMS to\nverify your mobile number"
                          .tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400)),
                  SizedBox(height: size.height * 0.12),
                  ElevatedButton(
                    onPressed: () async {
                      if (Formkey.currentState!.validate()) {
                        http.Response res = await http.post(
                          Uri.parse(Constant.endPointGetOTP),
                          body: {
                            "mobile": phone.text,
                            "full_name": name.text,
                          },
                        );
                        if (res.statusCode == 200) {
                          Map<String, dynamic> map = jsonDecode(res.body);
                          int otp = map["otp"];
                          Toast.show("${otp}", duration: 5);
                          Get.toNamed(
                              Routes.GET_OTP, arguments: [phone.text, otp,name.text]);
                        } else {
                          var snackBar = SnackBar(
                              content: Text("Information nor Correct"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: Text("Send OTP".tr,
                        style: Theme.of(context).textTheme.button),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
