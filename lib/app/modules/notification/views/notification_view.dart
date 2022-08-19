import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Notification'.tr, style: Theme.of(context).textTheme.bodyText2),
        elevation: 0.5,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: ((context, index) => Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                  tileColor: Theme.of(context).colorScheme.onPrimary,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1)),
                        child: Image(
                          image: const AssetImage("images/mask.png"),
                          height: size.height * 0.0562,
                          width: size.width * 0.123,
                        )),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Blog is updated",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 14),
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 10),
                        ),
                        Text(
                          "printing and typesetting industry.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 10),
                          overflow:TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "1m ago.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
