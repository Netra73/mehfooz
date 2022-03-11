import 'package:dio/dio.dart';
import 'package:womensafety/functions/Config.dart';
import 'package:womensafety/modules/ProductList.dart';

Future<List<ProductList>> getProducts(cid) async {

  final response = await Dio().getUri(Uri.parse(API_URL4+ 'cdetails/' + cid),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<ProductList> pList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String product_id = details['product_id'];
      String category_id = details['category_id'];
      String product_name = details['product_name'];
      String stock = details['stock'];
      String size = details['size'];
      String size_id = details['size_id'];
      String mrp = details['mrp'];
      String offer_price = details['offer_price'];
      String thumb = details['thumb'];
      pList.add(ProductList(product_id,category_id,product_name,stock,size,size_id,mrp,offer_price,thumb));
    }
  }
  return pList;
}
