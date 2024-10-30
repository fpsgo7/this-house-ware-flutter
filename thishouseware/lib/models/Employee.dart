import 'package:flutter/material.dart';

class Employee with ChangeNotifier{
  String? id;
  String? name;
  String? phone;
  String? email;
  int? departmentNo; // 부서 번호
  String? positionCode; // 직급 코드

  Employee(){}
  Employee.init({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.departmentNo,
    required this.positionCode
  });
}