
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';

Future<Response> getfDetails(String id) async {
  final response = await Dio().getUri(Uri.parse(API_URL4  + 'fdetails/' + id),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  print(response.data);
  return response;
}
