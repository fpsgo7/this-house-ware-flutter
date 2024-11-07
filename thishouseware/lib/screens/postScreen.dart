import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thishouseware/models/Post.dart';
import 'package:thishouseware/service/postService.dart';

class PostScreen extends StatefulWidget{
  PostService postService = PostService();
  @override
  State<StatefulWidget> createState()
    => _PostScreenState(); 
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _postList = [];
  // DB 로부터 가져오는 방식을 서버로부터 가져오는 방식으로 수정할 것이다.
  @override
  void initState() {
    super.initState();
    widget.postService
      .getAnnouncements()
      .then((result){
        setState(() {
          _postList = result;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항 리스트'),
        actions: [ 
            TextButton(
              onPressed: (){
                String path = '/user/mypage';
                Navigator
                .pushNamedAndRemoveUntil(
                  context, path, 
                  (route) =>  false
                );
              }, 
              child: const Text('마이페이지')
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: _postList.length,
        itemBuilder: (context,index){
          Post post = _postList[index];
          return ListTile(
            leading: Text('${post.postsNo}'),
            title: Text('${post.title}'),
            trailing: Text('${post.authority}님'),
            onTap: (){
              Navigator.pushNamed(
                context, 
                '/board/read',
                arguments: post.postsNo
              );
            },
          );
        }
      ),
    );
  }
}