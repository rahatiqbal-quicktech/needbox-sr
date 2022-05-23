import 'package:flutter/material.dart';
import 'package:needbox_sr/features/product_details/models/product_details_model.dart';
import 'package:needbox_sr/features/product_details/service/product_details_service.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';

import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/shared/widgets/whitespace.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';
import 'package:needbox_sr/utils/service_config.dart';

import 'widgets/product_description_widget.dart';
import 'widgets/seller_listtile.dart';
import 'widgets/stock_widget.dart';
import 'widgets/wholesale_productdetails_chart.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsModel? productDetails = ProductDetailsModel();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var temp = await ProductDetailsService().fetchProductDetails();
    setState(() {
      productDetails = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: const KText(
          text: "Details",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          fontSize: 18,
        ),
      ),
      body: FutureBuilder<ProductDetailsModel?>(
          future: ProductDetailsService().fetchProductDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var temp = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    CustomCardWidget(
                        onTap: () {},
                        child: Image(
                            image: NetworkImage(
                                "$imageBaseUrl${temp!.productdetails!.proimage?.image}"))),
                    whitespace(context, 2, 0),
                    CustomCardWidget(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: "${temp.productdetails!.productname}",
                                  textAlign: TextAlign.justify,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                                sizeH20,
                                WholesaleProdctDetailsChart(
                                    productPriceModel:
                                        temp.productdetails!.productprice),
                                sizeH20,
                                StockWidget(
                                    availableQuality:
                                        temp.productdetails!.productquantity),
                                sizeH10,
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: grey.shade300,
                                          borderRadius: borderRadiusC5,
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    sizeW10,
                                    const KText(
                                      text: "Quantity",
                                      // "cartC.quantityItems.toString()",
                                      fontWeight: FontWeight.w600,
                                    ),

                                    sizeW10,
                                    GestureDetector(
                                      onTap: () {},
                                      child:
                                          // Obx(
                                          //   () => cartC.quantityItems.value ==
                                          //           products.productquantity
                                          //       ? Container()
                                          //       :
                                          Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: grey.shade300,
                                          borderRadius: borderRadiusC5,
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 20,
                                        ),
                                      ),
                                    )

                                    // ),
                                  ],
                                ),
                                sizeH15,
                                const KText(
                                  text: 'Select Color:',
                                  fontSize: 12,
                                ),
                                sizeH10,
                                SizedBox(
                                  height: 50,
                                  // color: orangeO50,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: 2,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        const color = Colors.red;
                                        return GestureDetector(
                                          onTap: (() {}),
                                          child: Padding(
                                            padding: paddingH10,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 15.2,
                                                  backgroundColor: orangeO50,
                                                  child: const CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: color,
                                                      // HexColor(color.color.toString()),
                                                      child: Icon(
                                                        Icons.check,
                                                        color: color,
                                                      )),
                                                ),
                                                const KText(
                                                  text: "color",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SellerListTile(),
                        ],
                      ),
                    ),
                    sizeH10,
                    ProductDescriptionWidget(temp: temp),
                  ],
                ),
              );
            } else {
              return const LoadingAnimation();
            }
          }),
    );
  }
}
