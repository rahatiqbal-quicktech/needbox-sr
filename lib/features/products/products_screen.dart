import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/service_config.dart';

import 'widgets/custom_grid_card_widget.dart';

class ProductsScreen extends StatelessWidget with AllControllers {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: orangeO50,
        onRefresh: () {
          return refresh();
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
          child: Obx(() {
            var data = productsController.productsModel.value;
            var products = data.products?.data;
            return productsController.loading.value == false
                ? GridView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products?.length,
                    itemBuilder: (c, i) {
                      // final item =
                      //     wholesaleProductC.wholeSaleProductList[i];

                      return CustomGridCardWidget(
                        onTap: null,
                        imageUrl:
                            "$imageBaseUrl${products![i].proimage!.image}",
                        productname: "${products[i].productname}",
                        discount: null,
                        disprice: null,
                        oldprice: null,
                      );
                    })
                : const LoadingAnimation();
          }),
        ),
      ),
    );
  }

  refresh() {
    return productsController.getData();
  }
}
