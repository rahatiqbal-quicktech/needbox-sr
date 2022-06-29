// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:needbox_sr/features/orders/model/orders_model.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/utils/service_config.dart';

class OrdersService {
  var dio = Dio();
  Future<OrdersModel?> getOrders() async {
    String token = GetStorageProfile().getToken();
    try {
      final response = await dio.get(
        baseUrl + ordersEndpoint,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return OrdersModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
