import 'dart:core';

import 'package:podo/model/Post.dart';
import 'package:http/http.dart';


class PostList{
  final List<Post>? posts;

  PostList({required this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson){
    List<Post> posts = [];
    posts = parsedJson.map((i) => Post.fromJson(i)).toList();
    return PostList(posts: posts);
  }

}