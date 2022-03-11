import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/NewsFeedList.dart';

Future<List<NewsFeedList>> getNewsFeedList() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'news'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<NewsFeedList> nList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String title = details['title'];
      String image = details['image'];
      String description= details['description'];
      nList.add(NewsFeedList(id,title,image,description));
    }
  }
  return nList;
}
