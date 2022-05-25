import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/checkout/model/districts_model.dart';
import 'package:needbox_sr/utils/service_config.dart';

class DistrictsListController extends GetxController {
  final allDistricts = RxList<DistrictsModel>();
  final isLoading = RxBool(false);
  getAllDistricts() async {
    final dio = Dio();
    String endpoint = "/api/v1/districts";
    String fullUrl = baseUrl + endpoint;
    try {
      isLoading.value = true;
      final res = await dio.get(baseUrl + '/api/v1/districts');

      final List<DistrictsModel> data = res.data['districts']
          .map((json) => DistrictsModel.fromJson(json))
          .toList()
          .cast<DistrictsModel>();
      if (res.statusCode == 200) {
        allDistricts.clear();
        allDistricts.addAll(data);
        isLoading.value = false;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
