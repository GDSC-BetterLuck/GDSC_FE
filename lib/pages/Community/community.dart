import 'package:flutter/material.dart';
import 'package:jamera/pages/Community/post_item.dart';
import 'package:jamera/pages/Community/post_object.dart';
import 'package:jamera/pages/Community/post_road_info.dart';

class ExploreCommunityWidget extends StatefulWidget {
  const ExploreCommunityWidget({super.key});

  @override
  State<ExploreCommunityWidget> createState() => _ExploreCommunityWidgetState();
}

class _ExploreCommunityWidgetState extends State<ExploreCommunityWidget> {
 List<Post> posts = [
    Post(
        "This road is in bad condition",
        "Quoc Phong",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/map.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50)),
    Post(
        "Some building is being constructed so it is very dusty",
        "Quoc Phong",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/traffic.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50)),
    Post(
        "This road is in bad condition",
        "Quoc Phong",
        PostRoadInfo("HCMCity", "Quan 7"),
        const AssetImage("assets/images/traffic.png"),
        const AssetImage("assets/logo/small_logo.png"),
        DateTime(2024, 2, 25, 8, 50))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo/small_logo_resize.png"))),
            margin: EdgeInsets.only(left: 15.0),
          ),
          title: Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Community",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                  controller: null,
                  onTap: null,
                  onTapOutside: (event) => {FocusScope.of(context).unfocus()},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.edit_road_rounded),
                    labelText: 'Enter road name to find',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.0)),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        splashColor: Colors.blue,
                        tooltip: 'Find road',
                        icon: const Icon(Icons.search)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 248, 248),
                  )),
              Expanded(
                  child: PostListWidget(posts: posts)
              )
            ],
          ),
        ),
      ),
    );
  }
}
