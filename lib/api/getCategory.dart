import 'dart:async';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/Category.dart';

Future<List<Category>> geCategory() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'category'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<Category> cList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['category_id'];
      String title = details['category_name'];
      String icon = details['icon'];
      cList.add(Category(id,title,icon));
    }
  }
  return cList;
}
