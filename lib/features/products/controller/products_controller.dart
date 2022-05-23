// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:needbox_sr/features/products/model/products_model.dart';
import 'package:needbox_sr/features/products/service/products_service.dart';

class ProductsController extends GetxController {
  var productsModel = ProductsModel().obs;
  var loading = true.obs;

  getData() async {
    try {
      var temp = await ProductsService().fetchProducts();
      if (temp != null) {
        productsModel.value = temp;
        loading(false);
      } else {
        loading(false);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
