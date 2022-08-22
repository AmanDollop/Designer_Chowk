import 'package:designer_chock/ApiData/blog_detail_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:photo_view/photo_view.dart';

import '../Comman/comman_uri.dart';

class CommentListPage extends StatelessWidget {
  final List<Comments> dataOne;

  const CommentListPage({Key? key, required this.dataOne}) : super(key: key);

  get imageProvider => null;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Comments comments = dataOne.reversed.toList()[index];
          return Container(
            color: Theme.of(context).colorScheme.onPrimary,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: comments.userProfile == ''
                              ? AssetImage('images/mask_group.png')
                              : NetworkImage(
                                      Constant.baseUri + comments.userProfile!)
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comments.fullName!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          comments.createTime!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      child: Icon(
                        Icons.flag_outlined,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        comments.comment!,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.background,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Row(
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
                                  var color =
                                      isLiked ? Colors.blue : Colors.grey;
                                  Widget result;
                                  if (count != 0) {
                                    result = Text(
                                      "Like".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontSize: 14, color: color),
                                    );
                                  } else {
                                    result = Text(
                                      "Like".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontSize: 14, color: color),
                                    );
                                  }
                                  return result;
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue),
                                child: const Icon(
                                  Icons.thumb_up_alt_rounded,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "2",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              height: 10, color: Theme.of(context).colorScheme.background);
        },
        itemCount: dataOne.length);
  }
}
