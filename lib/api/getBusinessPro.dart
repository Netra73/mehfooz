import 'dart:async';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/BusinessPro.dart';

Future<List<BusinessPro>> getBusinessProfile(id) async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL4 + 'business/' + id),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<BusinessPro> bpList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String business_name = details['business_name'];
      String contact_number = details['contact_number'];
      String email = details['email'];
      String website = details['website'];
      String location = details['location'];
      String description = details['description'];
      String logo = details['logo'];
      bpList.add(BusinessPro(id:id,business_name:business_name,contact_number: contact_number,email: email,website: website,location: location,description: description,logo: logo));
    }
  }
  return bpList;
}
