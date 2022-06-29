// ignore_for_file: avoid_print

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_sr/features/dashboard/model/dashboard_model.dart';
import 'package:needbox_sr/utils/service_config.dart';

class DashboardService {
  final box = GetStorage();

  Future<DashboardModel?> getDashboardData() async {
    var token = box.read('token');
    String fullUrl = baseUrl + dashboardEndpoint;
    try {
      final response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return dashboardModelFromJson(response.body);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
