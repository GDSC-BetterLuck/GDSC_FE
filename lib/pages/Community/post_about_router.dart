import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jamera/pages/Community/post_item.dart';
import 'package:jamera/pages/Community/post_object.dart';
import 'package:jamera/pages/Community/post_road_info.dart';

class PostAboutRouter extends StatefulWidget {
  const PostAboutRouter({super.key});

  @override
  State<PostAboutRouter> createState() => _PostAboutRouterState();
}

class _PostAboutRouterState extends State<PostAboutRouter> {
  List<Post> posts = [
    Post(
        "This road is in bad condition",
        "Phong cute",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/map.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50)),
    Post(
        "This road is in bad condition",
        "Phong cute",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/traffic.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50)),
    Post(
        "This road is in bad condition",
        "Phong cute",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/traffic.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50))
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 800,
        width: 400,
        child: PostListWidget(posts: posts),
      ),
    ]);
  }
}
