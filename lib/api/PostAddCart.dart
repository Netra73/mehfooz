/*import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mehfooz/functions/Config.dart';

Future<String?> PostAddCart(body) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(API_URL4+'cart'));
  request.headers.set('Content-type', 'application/json');
  request.headers.set('Authorization','e10adc3949ba59abbe56e057f20f883e');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  httpClient.close();
  if(response.statusCode==200) {
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
    return reply;
  }

}*/



import 'dart:async';
import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';

Future<Response> PostAddCart(body) async {

  final response = await   Dio().postUri(Uri.parse(API_URL4+'signup'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'})
  );
  print(response);
  return response;
}