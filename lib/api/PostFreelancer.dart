import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/FreelancerForm.dart';

Future<Response> PostFreelancer(FreelancerForm freelancerForm) async {
  String filename = freelancerForm.profile_photo.path.split('/').last;
  FormData formData = FormData.fromMap({
    'first_name': freelancerForm.first_name,
    'last_name': freelancerForm.last_name,
    'phone': freelancerForm.phone,
    'email': freelancerForm.email,
    'website': freelancerForm.website,
    'about_me': freelancerForm.about_me,
    'profession': freelancerForm.profession,
    'skills': freelancerForm.skills,
    'profile_photo': await MultipartFile.fromFile(freelancerForm.profile_photo.path,filename: filename),
    "type":"image/png",

  });
  final response = await   Dio().postUri(Uri.parse(API_URL4+'freelancer'),
    data: formData,
    options: Options(headers:{'Content-type': 'multipart/form-data'}),

  );
  return response;

}