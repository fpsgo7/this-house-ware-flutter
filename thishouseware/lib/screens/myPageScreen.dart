import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:thishouseware/models/Employee.dart';

class MypageScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
    => _MypageScreenState(); 
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내정보'),
        actions: [ 
            TextButton(
              // 버튼을 누르면 게시판으로 이동한다.
              onPressed: (){
                Navigator
                .pushNamedAndRemoveUntil(
                  context, '/board/list', 
                  (route) =>  false
                );
              }, 
              child: Text('게시판'),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              // 공통된 레이아웃을 적용하고 싶을 경우
              border: TableBorder.all(),
              columnWidths: {
                // 해당 세로 줄에 해당하는 칸들의 크기에따라서 가로 길이 설정
                //0: IntrinsicColumnWidth(),
                // 특정 픽셀 만큼을 가로 길이로 설정
                0: FixedColumnWidth(100),
                // 나머지 세로 줄이 차지하고 남은공간 전체를 가로 길이로 설정
                1: FlexColumnWidth(),
              },
              children: [
                getItemField("아이디", context.watch<Employee>().id),
                getItemField("이름", context.watch<Employee>().name),
                getItemField("전화번호", context.watch<Employee>().phone),
                getItemField("이메일", context.watch<Employee>().email),
                getItemField("포지션 이름", context.watch<Employee>().positionName),
                getItemField("부서이름", context.watch<Employee>().departmentName),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
TableRow getItemField(String name, String? data) {
  return TableRow(children: [
    TableCell(
      child: Text(
        '$name',
        style: TextStyle(
          fontSize: 30, // 글자 크기
          fontWeight: FontWeight.bold,// 글자 굵기
        ),
        textAlign: TextAlign.center,// 글자 정렬
        softWrap: true,// 줄바꿈
      )
    ),
    TableCell(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          '$data',
          style: TextStyle(
            fontSize: 30
          ),
          textAlign: TextAlign.left,
        )
      ),
    ),
  ]);
}