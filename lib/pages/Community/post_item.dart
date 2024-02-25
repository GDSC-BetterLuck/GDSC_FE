import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jamera/pages/Community/post_object.dart';

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key, required this.posts});

  final List<Post> posts;

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  void likes(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          var post = widget.posts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Card(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: post.imageAuthor)),
                  ),
                ),
                Expanded(
                  child: ListTile(
                      title: Text(
                        post.author,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(post.address.roadCityName)),
                )
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(post.body.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: post.imagePost, fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 0),
                      child: Text(post.likes.toString()),
                    ),
                    const Text("likes")
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 9, 0),
                  child: MaterialButton(
                    onPressed: () {likes(post.likesPost);},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => {},
                                icon: post.userLiked
                                    ? const Icon(Icons.thumb_up_alt)
                                    : const Icon(Icons.thumb_up_alt_outlined)),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text(
                              "Likes",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ])),
          );
        });
    // return Text("phong");
  }
}
