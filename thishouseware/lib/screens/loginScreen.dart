import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                    service.login(
                      _idEdtingController.text,
                      _pwEdtingController.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}