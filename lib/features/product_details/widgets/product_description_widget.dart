import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:needbox_sr/features/product_details/models/product_details_model.dart';

import 'package:needbox_sr/shared/widgets/custom_back_button.dart';

import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    Key? key,
    required this.temp,
  }) : super(key: key);

  final ProductDetailsModel? temp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomCardWidget(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KText(
                    text: 'Description:',
                    fontWeight: FontWeight.w600,
                  ),
                  Html(
                    data: "${temp?.productdetails?.productdetails}",
                    style: {
                      'h1': Style(
                        color: black54,
                        fontSize: FontSize.xxLarge,
                        textAlign: TextAlign.justify,
                      ),
                      'br': Style(
                        color: black54,
                        fontSize: FontSize.xxLarge,
                        textAlign: TextAlign.justify,
                      ),
                      'p': Style(
                        color: black54,
                        fontSize: FontSize.larger,
                        textAlign: TextAlign.justify,
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -15,
          child: customBackButton(
            iconData: Icons.info_outline,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
