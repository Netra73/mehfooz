import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/DoctalkList.dart';

Future<List<DoctalkList>> getDoctorstalk() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'doctor'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<DoctalkList> vList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String title = details['title'];
      String video = details['video'];
      String thumb = details['thumb'];
      vList.add(DoctalkList(id,title,video,thumb));
    }
  }
  return vList;
}
