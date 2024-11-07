import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thishouseware/models/Post.dart';
import 'package:thishouseware/service/httpURL.dart';

class PostService {
  Future<List<Post>> getAnnouncements() async {
    List<Post> postList = [];

    var uri = Uri.parse(HttpURL.FRONT_HTTP+"flutter/announcements");
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.get(uri, headers: headers,);
    // utf8 로 바꾸자
    // print(utf8.decode(response.bodyBytes) );
    if (response.statusCode == 200) {
      List list = jsonDecode(utf8.decode(response.bodyBytes));
      for(dynamic json in list){
        //print(Post.fromJson(json).postsNo);
        postList.add(Post.fromJson(json));
      }
      

      return postList;

    }
    throw Exception('Failed to load album');
  }

  Future<Post> getPostInfo(int no) async{
    Post post;
    var uri = Uri.parse(HttpURL.FRONT_HTTP+"flutter/announcement?no=${no}");
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.get(uri, headers: headers,);
    // utf8 로 바꾸자
    if (response.statusCode == 200) {
      post = Post.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return post;
    }
    throw Exception('Failed to load album');
    
  }
}