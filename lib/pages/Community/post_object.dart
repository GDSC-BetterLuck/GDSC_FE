import 'package:flutter/material.dart';
import 'package:jamera/pages/Community/post_road_info.dart';

class Post {
  late String body;
  late String author;
  late AssetImage imagePost;
  late AssetImage imageAuthor;
  late PostRoadInfo address;
  late DateTime date;
  int likes = 0;
  bool userLiked = false;
  Post(this.body, this.author, this.address, this.imagePost, this.imageAuthor, this.date);
  void likesPost(){
    userLiked = !userLiked;
    if(userLiked){
      likes += 1;
    }
    else{
      likes -= 1;
    }
  }
}

