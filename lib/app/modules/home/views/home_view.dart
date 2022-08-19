import 'dart:io';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/data/sheets/bottom_sheet_location.dart';
import 'package:designer_chock/app/data/views/home_list_data.dart';
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _tabx = Get.put(HomeController());

  ImageProvider showProfilePic() {
    if (controller.image.value != null) {
      return FileImage(File(controller.image.value!.path));
    }
    if (controller.user_Profile.isNotEmpty) {
      return NetworkImage(Constant.baseUri + controller.user_Profile.value);
    }
    return const AssetImage("images/mask_group.png");
  }

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() => controller.myTabs.length > 0
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.8,
              leading: Padding(
                padding: EdgeInsets.only(left: 16),
                child: InkWell(
                  onTap: () {
                    controller.getReflect();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1),
                      image: DecorationImage(
                        image: showProfilePic(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              toolbarHeight: 62,
              title: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1)),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(fontSize: 14),
                    constraints: BoxConstraints(
                      maxHeight: 40,
                    ),
                    contentPadding: EdgeInsets.only(
                        top: size.height * 0.025, right: size.width * 0.025),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search here...".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.04),
                  child: Row(
                    children: [
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 11,
                            ),
                            child: Container(
                              height: 12,
                              width: 14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Center(
                                  child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                              )),
                            ),
                          )
                        ],
                      ),
                      InkWell(
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
                                            isLocation:
                                                controller.isIndore.value,
                                            changeLocation: (String value) {
                                              controller.changeCity(value);
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
                          child: const Icon(Icons.location_on_outlined)),
                    ],
                  ),
                )
              ],
              bottom: TabBar(
                controller: _tabx.controller,
                tabs: _tabx.myTabs,
                labelColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
                isScrollable: true,
                indicator: _TabIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabx.controller,
              children: [
                Container(
                  child: ElevatedCard(
                    data: controller.data,
                  ),
                ),
                Container(
                  child: ElevatedCard(
                    data: controller.data,
                  ),
                ),
                Container(
                  child: ElevatedCard(
                    data: controller.data,
                  ),
                ),
                Container(
                  child: ElevatedCard(
                    data: controller.data,
                  ),
                ),
                Container(
                  child: ElevatedCard(
                    data: controller.data,
                  ),
                ),
                Container(
                    child: ElevatedCard(
                  data: controller.data,
                )),
              ],
            ),
          )
        : Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 2,
            ),),
          ));
  }
}

class _TabIndicator extends BoxDecoration {
  final BoxPainter _painter;

  _TabIndicator({required Color color})
      : _painter = _TabIndicatorPainter(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _TabIndicatorPainter(Color color)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width * 0.5;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - 20, 0, _xPos + 25, 3),
        bottomLeft: const Radius.circular(5.0),
        bottomRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}
