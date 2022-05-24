import 'package:get/get.dart';
import 'package:needbox_sr/features/dashboard/controller/dashboard_controller.dart';
import 'package:needbox_sr/features/products/controller/products_controller.dart';
import 'package:needbox_sr/features/profile/controller/profile_Screen_controller.dart';

class AllControllers {
  final dashboardController = Get.put(DashboardController());
  final productsController = Get.put(ProductsController());
  final profileScreenController = Get.put(ProfileScreenController());
}
