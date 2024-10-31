import 'package:flutter/material.dart';

class Employee with ChangeNotifier{
  String? id;
  String? name;
  String? phone;
  String? email;
  int? departmentNo; // 부서 번호
  String? positionCode; // 직급 코드
  String? positionName;
  String? departmentName;

  Employee({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.departmentNo,
    required this.positionCode,
    required this.positionName,
    required this.departmentName,
  });
  Employee.init();

  getAll(Employee employee){
    this.id = employee.id;
    this.name = employee.name;
    this.phone = employee.phone;
    this.email = employee.email;
    this.departmentNo = employee.departmentNo;
    this.positionCode = employee.positionCode;
    this.positionName = employee.positionName;
    this.departmentName = employee.departmentName;
  }

  factory Employee.fromJson(Map<String,dynamic> json){
    return Employee(
      id : json["id"],
      name : json["name"],
      phone : json["phone"],
      email : json["email"],
      departmentNo : json["departmentNo"],
      positionCode : json["positionCode"],
      positionName : json["positionName"],
      departmentName : json["departmentName"],
    );
  }
}