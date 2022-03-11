import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';

Future<Response> getBusinessMoreInfo(String id) async {

  String username = 'admin';
  String password = '1234';

  final response = await   Dio().getUri(Uri.parse(API_URL4+'business_wrt_bid/'+id),
      options:Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  print(response.data);
  return response;

}