import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:womensafety/functions/Config.dart';


Future<String> getContacts(id) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(API_URL4 + 'contacts/' + id));
  request.headers.set('Content-type', 'application/json');
  HttpClientResponse response = await request.close();
  httpClient.close();
  String reply = await response.transform(utf8.decoder).join();
  return reply;
}
