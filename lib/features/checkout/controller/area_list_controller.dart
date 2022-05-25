import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/checkout/model/area_model.dart';

import 'package:needbox_sr/utils/service_config.dart';

class AreaListController extends GetxController {
  final allArea = RxList<AreaModel>();
  final isLoading = RxBool(false);
  getAllArea({required districtsId}) async {
    final dio = Dio();
    String endpoint = "/api/v1/sr/order/$districtsId";
    String fullUrl = baseUrl + endpoint;
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + '/api/v1/area/$districtsId');

      final List<AreaModel> data = res.data['areas']
          .map((json) => AreaModel.fromJson(json))
          .toList()
          .cast<AreaModel>();
      if (res.statusCode == 200) {
        allArea.clear();
        allArea.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
