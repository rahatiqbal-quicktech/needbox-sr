// ignore_for_file: avoid_print

import 'package:get_storage/get_storage.dart';
import 'package:needbox_sr/features/product_details/models/product_details_model.dart';
import 'package:needbox_sr/utils/service_config.dart';
import 'package:http/http.dart' as http;

class ProductDetailsService {
  final box = GetStorage();

  Future<ProductDetailsModel?> fetchProductDetails() async {
    var token = box.read('token');

    try {
      var response = await http.get(
          Uri.parse(baseUrl + "/api/v1/sr/product/details/10"),
          headers: {'Authorization': 'Bearer $token'});

      if (response.statusCode == 200) {
        return productDetailsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
