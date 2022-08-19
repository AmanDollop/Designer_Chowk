import 'package:designer_chock/app/data/views/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedLocationPage extends StatelessWidget {
  const SelectedLocationPage(
      {Key? key,
      required this.isLocation,
      required this.changeLocation,
      required this.onPressed})
      : super(key: key);
  final String isLocation;
  final Function(String value) changeLocation;
  final VoidCallback onPressed;
  static List<String> listPlayers = <String>[
    "Indore".tr,
    "BHOPAL".tr,
    "NEW DELHI".tr,
    "BANGALORE".tr,
    "MUMBAI".tr,
    "NAGPUR".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Text(
            "Choose Location".tr,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 13),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3),
              itemCount: 6,
              itemBuilder: (context, index) {
                return SelectedCard(
                  showImage: false,
                  imagePath: "images/wxr.png",
                  selected: isLocation == listPlayers[index],
                  textTitle: listPlayers[index],
                  onPressed: () {
                    changeLocation(listPlayers[index]);
                  }, //showImage: false,
                );
              },
            ),
          ),
          SizedBox(height: 23),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52)),
              onPressed: onPressed,
              child:  Text("SAVE LOCATION".tr),
            ),
          ),
        ],
      ),
    );
  }
}
