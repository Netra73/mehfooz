
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/FreelancerList.dart';

Future<List<FreelancerList>> getFreelancerList() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'flist'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<FreelancerList> fList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String first_name = details['first_name'];
      String last_name = details['last_name'];
      String profession = details['profession'];
      String profile_photo = details['profile_photo'];
      fList.add(FreelancerList(id,first_name,last_name,profession,profile_photo));
    }
  }
  return fList;
}
