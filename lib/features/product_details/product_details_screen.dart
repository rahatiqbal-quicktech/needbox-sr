import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/cart/cart_screen.dart';
import 'package:needbox_sr/features/product_details/models/product_details_model.dart';
import 'package:needbox_sr/features/product_details/service/product_details_service.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/shared/modles/cart/cart_models.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';

import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/shared/widgets/snackbar_widget.dart';
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

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with AllControllers {
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

  //
  var selectedColor = '';
  var selectedColorName = '';
  bool? isWishListed;

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
                                    onTap: () {
                                      cartC.decrementQnty();
                                    },
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
                                  Obx(() {
                                    return KText(
                                      text: cartC.quantityItems.toString(),
                                      // "cartC.quantityItems.toString()",
                                      fontWeight: FontWeight.w600,
                                    );
                                  }),
                                  sizeW10,
                                  GestureDetector(
                                      onTap: () {
                                        cartC.incrementQnty();
                                      },
                                      child: Obx(
                                        () => cartC.quantityItems.value ==
                                                temp.productdetails
                                                    ?.productquantity
                                            ? Container()
                                            : Container(
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
                                      )),
                                ],
                              ),
                              sizeH15,
                              temp.selectcolors!.isEmpty
                                  ? Container()
                                  : const KText(
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
                                    itemCount: temp.selectcolors?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      // const color = Colors.red;
                                      return Padding(
                                          padding: paddingH10,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedColor =
                                                    "${temp.selectcolors![index].colorName}";
                                                selectedColorName =
                                                    "${temp.selectcolors![index].colorName}";
                                              });
                                            },
                                            child: Text(
                                                '${temp.selectcolors![index].colorName}'),
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  color: selectedColor ==
                                                          "${temp.selectcolors![index].colorName}"
                                                      ? orange
                                                      : Colors.white),
                                            ),
                                          ));
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
                  whitespace(context, 15, 0),
                ],
              ),
            );
          } else {
            return const LoadingAnimation();
          }
        },
      ),
      bottomSheet: Container(
        height: 60,
        color: white,
        width: Get.width,
        // color: darkBlue,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder<ProductDetailsModel?>(
                  future: ProductDetailsService().fetchProductDetails(),
                  builder: (c, s) {
                    if (!s.hasData) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: borderRadiusC10,
                          color: red,
                        ),
                        alignment: Alignment.center,
                        child: const KText(
                          text: 'Add To Cart',
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      );
                    }

                    final item = s.data!.productdetails;

                    return GestureDetector(
                      onTap: () {
                        selectedColor.isEmpty
                            ? snackBarWidget(
                                title: 'Opps!',
                                message: 'Please select a product color',
                                isRed: true,
                              )
                            : cartC.addItemInCart(
                                CartModels(
                                  id: 10,
                                  image:
                                      "$imageBaseUrl${item?.proimage!.image}",
                                  productname: item?.productname,
                                  proNewprice: item?.productnewprice ??
                                      item?.productprice!.price,
                                  proOldprice: item?.productoldprice ??
                                      item?.productprice!.price,
                                  discount: 20,
                                  shippingfee: '',
                                  productColor: selectedColorName,
                                  quantity: cartC.quantityItems.toInt(),
                                  stock: item?.productquantity,
                                ),
                              );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: borderRadiusC10,
                          color: red,
                        ),
                        alignment: Alignment.center,
                        child: const KText(
                          text: 'Add To Cart',
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              sizeW10,
              sizeW10,
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    Get.to(() => CartScreen());
                  }),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: borderRadiusC10,
                      color: red,
                    ),
                    alignment: Alignment.center,
                    child: const KText(
                      text: 'Buy Now',
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
