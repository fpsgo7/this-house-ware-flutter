import 'package:flutter/material.dart';

class Post with ChangeNotifier{
  // 화면상으로 보여줄 것만 가져오자.
	int? postsNo; // 게시글 번호 *
	String? submitDT; // 작성 날짜
	String? title; // 제목
	String? content; // 내용
	String? id; // 아이디 *
	String? name; // 이름 *
  String? authority;

  Post({
    required this.postsNo,
    required this.submitDT,
    required this.title,
    required this.content,
    required this.id,
    required this.name,
    required this.authority
  });

  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
      id : json["id"],
      name : json["name"],
      postsNo : json["postsNo"],
      title : json["title"],
      content : json["content"],
      submitDT : json["submitDT"],
      authority: json["authority"]
    );
  }
}