import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> login(
       String id, String password) async {
    var uri = Uri.parse("http://localhost:8099/flutter/login");
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'id': '$id',
      'password': '$password'
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    print("${response.body}");

    return response;
  }
}