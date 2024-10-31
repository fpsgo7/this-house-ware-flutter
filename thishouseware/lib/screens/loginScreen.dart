import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:thishouseware/models/Employee.dart';
import 'package:thishouseware/service/employeeService.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
    => _LoginScreenState(); 
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _idEdtingController
    = TextEditingController();
  TextEditingController _pwEdtingController
    = TextEditingController();
  
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인 화면'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _idEdtingController,
                  decoration: InputDecoration(hintText: "아이디"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _pwEdtingController,
                  decoration: InputDecoration(hintText: "비밀번호"),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  child: const Text('전송'),
                  onPressed: () {
                    var employeeFuture = service.login(
                      _idEdtingController.text,
                      _pwEdtingController.text,
                    );
                    Employee employee =  Employee.init();
                    // employeeFuture 에 저장된 정보는 
                    // then 밬에서는 사용할 수 없다(뒤에있는 문장이 먼저 실행되버림)
                    employeeFuture.then((value){
                      print('value: $value');

                      // 서버 정상 로그인 실패시
                      if(value.id == null){
                        Navigator
                        .pushNamedAndRemoveUntil(
                          // todo 마이페이지
                          context, '/user/login', 
                          (route) =>  false
                        );
                      }
                      // 직원정보 가져오기 성공
                      employee = value;
                      // 매서드를 통해 provider 에 정보담기
                      setContext(context, employee);
                      Navigator
                      .pushNamedAndRemoveUntil(
                        // todo 마이페이지
                        context, '/user/mypage', 
                        (route) =>  false
                      );
                    }).catchError((error){
                      print('error: $error');
                      Navigator
                      .pushNamedAndRemoveUntil(
                        // todo 마이페이지
                        context, '/user/login', 
                        (route) =>  false
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
setContext(BuildContext context, Employee employee){
  context.read<Employee>().getAll(employee);
}