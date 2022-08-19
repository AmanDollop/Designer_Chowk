import 'package:designer_chock/ApiData/blog_data.dart';
import 'package:designer_chock/app/data/Comman/comman_uri.dart';
import 'package:designer_chock/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ElevatedCard extends StatelessWidget {
  final List<Blog> data;

  ElevatedCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  bool count = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          Blog blog = data[index];
          return Card(
            color: Theme.of(context).colorScheme.onPrimary,
            elevation: 0,
            child: SizedBox(
              width: 300,
              height: 170,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.POST_DETAIL,
                            arguments: [blog.blogId]);
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 71,
                                width: 71,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(Constant.baseUri +
                                        blog.blogImage.toString()),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blog.blogTitle.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                      Text(
                                        blog.blogDescription.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 12,
                                            ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10 min ago".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 11),
                                ),
                                Text(
                                  "BUSINESS".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          fontSize: 12,
                                          color: const Color(0xff00920F)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 10,
                      endIndent: 10,
                      indent: 10,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            LikeButton(
                              size: 15,
                              circleColor: const CircleColor(
                                  start: Color(0xff00ddff),
                                  end: Color(0xff0099cc)),
                              bubblesColor: const BubblesColor(
                                dotPrimaryColor: Color(0xff33b5e5),
                                dotSecondaryColor: Color(0xff0099cc),
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.thumb_up_alt_rounded,
                                  color: isLiked ? Colors.blue : Colors.grey,
                                  size: 15,
                                );
                              },
                              likeCount: 0,
                              countBuilder:
                                  (int? count, bool isLiked, String text) {
                                var color = isLiked ? Colors.blue : Colors.grey;
                                Widget result;
                                if (count != 0) {
                                  result = Text(
                                    "Like".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(fontSize: 14, color: color),
                                  );
                                } else {
                                  result = Text(
                                    "Like".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(fontSize: 14, color: color),
                                  );
                                }
                                return result;
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.comment,
                              size: 15,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              "Comment".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Share.share(
                                'check out my website https://example.com');
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.share,
                                size: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                "Share".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              height: 10, color: Theme.of(context).colorScheme.background);
        },
        itemCount: data.length);
  }
}
