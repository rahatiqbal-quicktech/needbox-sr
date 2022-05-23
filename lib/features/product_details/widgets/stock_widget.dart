import 'package:flutter/material.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

class StockWidget extends StatelessWidget {
  final int? availableQuality;
  const StockWidget({
    required this.availableQuality,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const KText(
          text: 'Stock:',
          fontSize: 12,
          color: black54,
        ),
        sizeW5,
        Container(
          decoration: BoxDecoration(
            borderRadius: borderRadiusC10,
            border: Border.all(
              color: grey.shade300,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 2,
            ),
            child: Row(
              children: [
                KText(
                  text: "$availableQuality", // Product quantity goes here
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                const KText(
                  text: ' Available',
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
