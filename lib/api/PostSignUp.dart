import 'dart:async';
import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/UserForm.dart';

Future<Response> PostSignUp(UserForm userForm) async {
  var body =
  {
    'first_name' : userForm.fname,
    'last_name' : userForm.lname,
    'email':userForm.email,
    'password':userForm.password,
    'phone':userForm.mobile,
    'cp1':userForm.cp1,
    'cp2':userForm.cp2,
    'cp3':userForm.cp3,
    'cp4':userForm.cp4,
    'cp5':userForm.cp5,
  };

  final response = await   Dio().postUri(Uri.parse(API_URL4+'signup'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'})
  );
  return response;
}