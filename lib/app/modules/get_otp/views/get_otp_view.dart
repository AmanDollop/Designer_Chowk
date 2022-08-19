import 'dart:convert';
import 'package:designer_chock/app/Colors/colors_manager.dart';
import 'package:http/http.dart' as http;
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../../../data/Comman/comman_uri.dart';
import '../controllers/get_otp_controller.dart';

class GetOtpView extends GetView<GetOtpController> {
  GetOtpView({Key? key}) : super(key: key);
  final Fromkey = GlobalKey<FormState>();
  final pinController = TextEditingController();
   String name="";
   String phone="";
   String email="";
   String Token="";

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);


    Size size = MediaQuery.of(context).size;
    String? currentText;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: Fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back)),
                        Image(
                            image: const AssetImage(
                              "images/designer-chowk-logo_eng.png",
                            ),
                            height: size.height * 0.08),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Text("Get OTP".tr,
                      style: Theme.of(context).textTheme.headline1),
                  Divider(
                      endIndent: size.width * 0.83,
                      color: Colors.red,
                      thickness: 3,
                      height: size.height * 0.015),
                  SizedBox(height: size.height * 0.005),
                  Text("Enter the OTP you received to".tr,
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(height: size.height * 0.009),
                  Text(("+91 ${controller.phone}"),
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: size.height * 0.031),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: PinCodeTextField(
                        controller: pinController,
                        /*validator: (value) =>
                            validatorpage.validationPassword(password: value),*/
                        appContext: context,
                        pinTheme: PinTheme(
                            inactiveColor:
                                Theme.of(context).colorScheme.outline,
                            inactiveFillColor:
                                Theme.of(context).colorScheme.outline,
                            activeColor: Theme.of(context).colorScheme.outline,
                            activeFillColor:
                                Theme.of(context).colorScheme.outline,
                            selectedColor: LightModeColors().secondaryColor,
                            selectedFillColor:
                                Theme.of(context).colorScheme.outline,
                            shape: PinCodeFieldShape.box,
                            fieldWidth: size.height * 0.078,
                            fieldHeight: size.height * 0.07,
                            borderRadius: BorderRadius.circular(8),
                            borderWidth: 0.90),
                        enableActiveFill: true,
                        cursorColor: LightModeColors().secondaryColor,
                        keyboardType: TextInputType.number,
                        textStyle: Theme.of(context).textTheme.headline6,
                        length: 4,
                        obscureText: false,
                        onChanged: (String value) => currentText = value),
                  ),
                  Row(
                    children: [
                      Text("If you didn't receive a code!".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w400)),
                      TextButton(
                        onPressed: () async {
                          if (Fromkey.currentState!.validate()) {
                            pinController.text = '';
                            http.Response res = await http.post(
                              Uri.parse(Constant.endPointGetOTP),
                              body: {
                                "mobile": controller.phone,
                                "full_name": controller.name,
                              },
                            );
                            if (res.statusCode == 200) {
                              Map<String, dynamic> map = jsonDecode(res.body);
                              int otp = map["otp"];
                              Toast.show("${otp}", duration: 5);
                              controller.otp = otp;
                            } else {
                              var snackBar = SnackBar(
                                  content:
                                      Text("Information is not Correct".tr));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text(
                          "Resend".tr,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.115),
                  ElevatedButton(
                    onPressed: () async {
                      if (pinController.text.length == 4) {
                        http.Response res = await http.post(
                          Uri.parse(Constant.endPointMatchOTP),
                          body: {
                            "mobile": controller.phone,
                            "otp": pinController.text,
                          },
                        );

                        if (res.statusCode == 200) {
                          Map<String, dynamic> map = jsonDecode(res.body);
                          Map<String,dynamic>list=map["match_otp_data"];
                          name = list["full_name"];
                          phone = list["mobile"];
                          email=list["email"];
                          Token=list["token"];
                          print(
                              "::::::::::::::::::::::::::::::::::::: ${name}");
                          print(
                              "::::::::::::::::::::::::::::::::::::: ${phone}");
                          print(
                              "::::::::::::::::::::::::::::::::::::: ${Token}");


                          var sd = await SharedPreferences.getInstance();
                          sd.setString("name", name);
                          sd.setString("phone", phone);
                          sd.setString("email", email);
                          sd.setString("token", Token);





                          Get.offAllNamed(Routes.HOME);


                        } else {
                          var snackBar = const SnackBar(
                              content: Text("OTP is not Correct"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else if (pinController.text == null ||
                          pinController.text.isEmpty) {
                        var snackBar =
                            SnackBar(content: Text('Please Enter Pin'.tr));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (pinController.text.length != 4) {
                        var snackBar = SnackBar(
                            content: Text('Please Enter Valid 4 Digit Pin'.tr));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text("Verify".tr,
                        style: Theme.of(context).textTheme.button),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
