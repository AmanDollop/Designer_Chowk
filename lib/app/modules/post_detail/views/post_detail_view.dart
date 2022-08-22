import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/data/views/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/post_detail_controller.dart';

class PostDetailView extends GetView<PostDetailController> {
  const PostDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text(
              'Business'.tr,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.list),
              ),
            ],
            elevation: 0.4,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Column(
                              children: [
                                if (controller.data.value?.blogImage != null)
                                  Image.network(Constant.baseUri +
                                      controller.data.value!.blogImage
                                          .toString()),
                                Container(
                                  height: 28,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 30, left: 10),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Text(
                                      (controller.data.value?.createTime ?? "")
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                    ),
                                    const VerticalDivider(thickness: 2),
                                    Text(
                                      (controller.data.value?.createDate ?? "")
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, right: 55),
                              child: Container(
                                height: 35,
                                width: 35,
                                child: FloatingActionButton(
                                    backgroundColor: (controller
                                                    .data.value?.isLikes ==
                                                '0' ||
                                            controller.isPressed.value == '0')
                                        ? Colors.white
                                        : Colors.blue,
                                    onPressed: () =>
                                        controller.clickLikeButton(),
                                    child: Icon(Icons.thumb_up_alt,
                                        size: 15,
                                        color: (controller
                                                        .data.value?.isLikes ==
                                                    '0' ||
                                                controller.isPressed.value ==
                                                    '0')
                                            ? Colors.grey
                                            : Colors.white)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, right: 10),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                child: InkWell(
                                  onTap: () {
                                    Share.share(
                                        'check out my website https://example.com');
                                  },
                                  child: Icon(
                                    Icons.share,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (controller.data.value?.blogTitle ?? "")
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  (controller.data.value?.blogDescription ?? "")
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            "All Comments".tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                        ),
                        CommentListPage(dataOne: controller.dataone.value),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                color: Theme.of(context).colorScheme.onPrimary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Text(controller.count == '' ? '' : ''),
                      Expanded(
                        child: TextField(
                          controller: controller.comment,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 20, 10, 0),
                            prefixIcon:
                                const Icon(Icons.emoji_emotions_outlined),
                            hintText: "Write your message...",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                  width: 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {
                            return controller.postComments();
                          },
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
