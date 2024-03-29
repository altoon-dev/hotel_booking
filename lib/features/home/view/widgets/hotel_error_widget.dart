import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/extensions/extensions.dart';

import '../../../../common_widgets/text/custom_text.dart';
import '../../../../styles/font_styles.dart';

class HotelErrorWidget extends StatelessWidget {
  const HotelErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "Oops !",
            textAlign: TextAlign.center,
            containerAlignment: Alignment.center,
            margin: 25.horizontal,
            textStyle: customFontStyle(
              fontSize: 22,
              fontHeight: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: "Something went wrong",
            textAlign: TextAlign.center,
            containerAlignment: Alignment.center,
            margin: 25.horizontal,
            textStyle: customFontStyle(
              fontSize: 18,
              fontHeight: 22,
            ),
          ),
        ],
      ),
    );
  }
}
