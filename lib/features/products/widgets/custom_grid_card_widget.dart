import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/cached_networkimage_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

class CustomGridCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String productname;
  final int? disprice;
  final int? oldprice;
  final int? discount;
  final void Function()? onTap;

  final bool? isFavoritePage;
  final Widget? favoriteIcon;

  const CustomGridCardWidget({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.productname,
    required this.discount,
    required this.disprice,
    required this.oldprice,
    this.isFavoritePage,
    this.favoriteIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  // color: Colors.white,
                  width: Get.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImageWidget(
                      imageUrl: imageUrl.toString(),
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                discount != null
                    ? Positioned.fill(
                        child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: Container(
                            height: 15,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "-$discount%",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ))
                    : Container(),
                isFavoritePage == true
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: favoriteIcon as Widget,
                      )
                    : Container(),
              ],
            ),
            sizeH10,
            const Spacer(),
            Padding(
              padding: paddingH10,
              child: Text(
                productname,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ),
            sizeH5,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: KText(
                    text: disprice == null ? '' : "৳$disprice",
                    fontSize: 14,
                    color: orangeO50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                sizeW10,
                KText(
                  text: oldprice == null ? '' : '৳$oldprice',
                  decoration: TextDecoration.lineThrough,
                  fontSize: 11,
                  color: Colors.grey.shade700,
                ),
              ],
            ),
            sizeH10,
          ],
        ),
      ),
    );
  }
}
