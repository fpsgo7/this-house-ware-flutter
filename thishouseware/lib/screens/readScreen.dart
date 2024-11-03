import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thishouseware/models/Post.dart';
import 'package:thishouseware/service/postService.dart';


class ReadScreen extends StatefulWidget{
  PostService postService = PostService();
  @override
  State<StatefulWidget> createState()
    => _ReadScreenState(); 
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<Post> _post;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments 
      = ModalRoute.of(context)!.settings.arguments;
    if(arguments != null){
      no = arguments as int;
      _post = widget.postService.getPostInfo(no);
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _post, 
      builder: (context, snapshot) {
        // snapshot: Future의 상태와 결과 등을 가진 객체
        if (snapshot.connectionState == ConnectionState.waiting) {
          // ConnectionState : Future의 상태 none -> waiting/active -> done
          return const Center(child: CircularProgressIndicator());
          // CircularProgressIndicator : 앱 진행사항을 원형으로 나타내는 위젯
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data found'));
        } else {
          // 실제 화면에 렌더링 될 위젯 정의
          var result = snapshot.data;
          return _scaffoldBuilderUser(result as Post, context, widget);
        }
      },
    );
  }
}
Widget _scaffoldBuilderUser(Post post, BuildContext context, ReadScreen widget ){
  return Scaffold(
    appBar: AppBar(
      title: Text('게시글'),
      actions: [ 
          TextButton(
            onPressed: (){
              String path = "/user/mypage";
              Navigator
              .pushNamedAndRemoveUntil(
                context, path, 
                (route) =>  false
              );
            }, 
            child:Text('마이페이지'),
          ),
      ],
    ),
    body : _padding(post),
  );
}

Widget _padding(Post post){
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 100,
      horizontal: 20
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '제목 :${post.title}',
        ),
        Text(
          '작성자 :${post.id}',
        ),
        Text(
          '${post.content}',
        ),
      ],
    ),
  );
}
