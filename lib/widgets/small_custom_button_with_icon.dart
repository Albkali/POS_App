import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/utils.dart';

class SmallCustomButtonWithIcon extends StatelessWidget {
  String? label;
  Color? borderColor;
  Color? textColor;
  Function()? onTap;
  Color? bgcolor;
  IconData? icon;
  Color? iconColor;
  bool? isLeft;
  bool? isTagType;
  SmallCustomButtonWithIcon(
      {Key? key,
      this.label,
      this.borderColor,
      this.textColor,
      this.onTap,
      this.icon,
      this.bgcolor,
      this.iconColor,
      this.isLeft,
      this.isTagType = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: const EdgeInsets.only(left: 6,right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: bgcolor,
          border: Border.all(color: borderColor ?? Colors.transparent,width: 1),
        ),
        margin: isTagType == false ? const EdgeInsets.only(right: 16,left: 16) : const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isLeft != null)
              ...[
                if(icon != null)
                  Icon(icon,color: iconColor ?? AppColor.white,size: 20,),
                const Gap(6),
                Utils.mediumHeadingText(text: label,color: textColor),
              ]
            else
              ...[
                Utils.mediumHeadingText(text: label,color: textColor),
                const Gap(6),
                if(icon != null)
                  Icon(icon,color: iconColor ?? AppColor.white,size: 20,),
              ]

          ],
        ),
      ),
    );
  }
}