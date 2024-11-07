import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:thishouseware/models/Employee.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:thishouseware/service/httpURL.dart';


class Service {
  Future<Employee> login(
       String id, String password) async {
    var uri = Uri.parse(HttpURL.FRONT_HTTP+"flutter/login");
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'id': '$id',
      'password': '$password'
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    // utf8 로 바꾸자
    // print(utf8.decode(response.bodyBytes) );
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw Exception('Failed to load album');
  }
}