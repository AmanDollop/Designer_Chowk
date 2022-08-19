import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
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
                              "images/designer-chowk-logo_eng.png"),
                          height: size.height * 0.08),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text("Sign Up", style: Theme.of(context).textTheme.headline1),
                Divider(
                    endIndent: size.width * 0.83,
                    color: Colors.red,
                    thickness: 3,
                    height: size.height * 0.015),
                SizedBox(height: size.height * 0.005),
                Text("Create your account",
                    style: Theme.of(context).textTheme.bodyText2),
                SizedBox(height: size.height * 0.0651),
                TextField(
                    style: Theme.of(context).textTheme.bodyText1,
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
                      hintText: "Enter your number",
                      counterText: "",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,),
                SizedBox(height: size.height * 0.012),
                TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        height: size.height * 0.02,
                        width: size.width * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.email_outlined, size: 20),
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
                      hintText: "Enter your email id",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.emailAddress,),
                SizedBox(height: size.height * 0.012),
                TextField(
                    style: Theme.of(context).textTheme.bodyText1,
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
                      hintText: "Enter your full name",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.name),
                SizedBox(height: size.height * 0.058),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.PROFILE_VIEW);

                  },
                  child:
                      Text("Submit", style: Theme.of(context).textTheme.button),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
