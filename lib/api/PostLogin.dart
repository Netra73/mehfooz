import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/LoginForm.dart';

Future<Response> PostLogin(LoginForm loginForm) async {
  var body =
  {
    'email': loginForm.username,
    'password': loginForm.password
  };

  final response = await   Dio().postUri(Uri.parse(API_URL4+'signin'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  return response;
}