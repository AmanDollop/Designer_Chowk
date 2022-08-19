import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../views/selection_card.dart';

class SelectedLanguagePage extends StatelessWidget {
  const SelectedLanguagePage(
      {Key? key,
      required this.isEn,
      required this.changeLanguage,
      required this.onPressed})
      : super(key: key);
  final String isEn;
  final Function(String value) changeLanguage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 5
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: size.height*0.015),
              Text(
                "Change Language".tr,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: size.height*0.01),
              SelectedCard(showImage: true,
                imagePath: "images/wxr.png",
                selected: isEn == "en",
                textTitle: "ENGLISH".tr,
                onPressed: () {
                  changeLanguage("en");
                }, //showImage: false,
              ),
              const SizedBox(height:2),

              SelectedCard(
                showImage: true,
                imagePath: "images/Converted.png",
                selected: isEn == "hi",
                textTitle: "HINDI".tr,
                onPressed: () {
                  changeLanguage("hi");
                }, //showImage: false,
              ),
              SizedBox(height: size.height*0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52)),
                onPressed: (){
                  {
                    //Get.back();
                    if (isEn == "en") {
                      var local = Locale("en", "US");
                      Get.updateLocale(local);
                    } else {
                      var local = Locale("hi", "IN");
                      Get.updateLocale(local);
                    }
                    Get.back();
                  }
                },
                child:  Text("SAVE LANGUAGE".tr),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
