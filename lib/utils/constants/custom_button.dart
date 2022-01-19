import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';

import '../utils.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      alignment: Alignment.center,
      child: Utils.mediumHeadingText(text: title,color: AppColor.white,fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.sky_blue.withOpacity(0.9),
      ),
    );
  }
}
