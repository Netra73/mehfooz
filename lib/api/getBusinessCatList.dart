import 'dart:async';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/BusinessCat.dart';

Future<List<BusinessCat>> getBusinessCatList() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'bcatlist'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));

  List<BusinessCat> bList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['b_cat_id'];
      String title = details['business_category'];
      String icon = details['icon'];
      bList.add(BusinessCat(id,title,icon));
      print(bList.length);
    }
  }
  return bList;
}
