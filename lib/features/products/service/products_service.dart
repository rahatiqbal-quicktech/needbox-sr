// ignore_for_file: avoid_print

import 'package:get_storage/get_storage.dart';
import 'package:needbox_sr/features/products/model/products_model.dart';
import 'package:needbox_sr/utils/service_config.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  String endPoint = "/api/v1/sr/products";
  late String fullUrl;
  final box = GetStorage();

  fetchProducts() async {
    var token = box.read('token');
    fullUrl = baseUrl + endPoint;

    try {
      var response = await http
          .get(Uri.parse(fullUrl), headers: {'Authorization': 'Bearer $token'});
      print("This is response data  ");
      print(response.body);
      if (response.statusCode == 200) {
        return productsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
