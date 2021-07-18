import 'dart:convert';
import 'package:http/http.dart';
import 'package:podo/model/PostLists.dart';


class Network{
  final String url;

  Network({required this.url});

  Future<PostList> loadPosts() async{
     final response =await get(Uri.parse(Uri.encodeFull(url)));
     if(response.statusCode == 200){
       return PostList.fromJson(json.decode(response.body)); // we get a json object
     }else{
       throw Exception("Failed to get posts");
     }
  }

}

