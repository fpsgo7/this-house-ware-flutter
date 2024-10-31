import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thishouseware/models/Employee.dart';

import 'screens/loginScreen.dart';
import 'screens/myPageScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Employee>(
          create: (_) => Employee.init(),
        ),
      ],
      child: MaterialApp(
        title: 'Memo Demo',
        initialRoute: '/user/login',
        routes: {
          // 로그인
          '/user/login': (context) => LoginScreen(),
          // 내화면
          '/user/mypage': (context) => MypageScreen(),
        },
      ),
    );
  }
}

