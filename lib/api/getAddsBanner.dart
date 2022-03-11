import 'dart:async';
import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';

Future<List> getAddsBanner() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'adds'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<String> sList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String title = details['title'];
      String image = details['image'];
      sList.add(image);
    }
  }
  return sList;
}
