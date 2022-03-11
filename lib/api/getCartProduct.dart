import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:womensafety/modules/ProductList.dart';

import '../functions/Config.dart';

Future<List<ProductList>> getCartProduct(String size_id) async {
  List<ProductList> cPList = [];

  var body =
  {
    'size_id': size_id,
  };
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(API_URL4+'cart'));
  request.headers.set('Content-type', 'application/json');
  request.headers.set('Authorization','e10adc3949ba59abbe56e057f20f883e');
  request.add(utf8.encode(json.encode(body)));
  HttpClientResponse response = await request.close();
  httpClient.close();
  if(response.statusCode==200) {
    String reply = await response.transform(utf8.decoder).join();
    var jdata = jsonDecode(reply);
    var data = jdata['data'];
    for(var details in data){
      String product_id = details['product_id'];
      String category_id = details['category_id'];
      String product_name = details['product_name'];
      String stock = details['stock'];
      String size = details['size'];
      String size_id = details['size_id'];
      String mrp = details['mrp'];
      String offer_price = details['offer_price'];
      String thumb = details['thumb'];
      cPList.add(ProductList(product_id,category_id,product_name,stock,size,size_id,mrp,offer_price,thumb));
    }
  }
  return cPList;
}