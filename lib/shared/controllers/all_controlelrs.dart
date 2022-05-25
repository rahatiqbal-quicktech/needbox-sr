import 'package:get/get.dart';
import 'package:needbox_sr/features/checkout/controller/area_list_controller.dart';
import 'package:needbox_sr/features/checkout/controller/get_districts_controller.dart';
import 'package:needbox_sr/features/checkout/controller/order_save_controller.dart';
import 'package:needbox_sr/features/dashboard/controller/dashboard_controller.dart';
import 'package:needbox_sr/features/products/controller/products_controller.dart';
import 'package:needbox_sr/features/profile/controller/profile_Screen_controller.dart';
import 'package:needbox_sr/shared/controllers/cart/cart_controller.dart';

class AllControllers {
  final dashboardController = Get.put(DashboardController());
  final productsController = Get.put(ProductsController());
  final profileScreenController = Get.put(ProfileScreenController());
  // copied
  final cartC = Get.put(CartController());
  final districtsListC = Get.put(DistrictsListController());
  final areaListC = Get.put(AreaListController());
  final orderSaveC = Get.put(OrderSaveController());
}
