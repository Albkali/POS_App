import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/widgets/custom_app_bar.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget regularHeadingText(
      { String? text, double? textSize, Color? color}) {
    return Text(
      text??'',
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 18,
        fontWeight: FontWeight.w300,
        color: color ?? AppColor.black_2,
      ),
    );
  }

  static Widget mediumHeadingText(
      { String? text, double? textSize, Color? color,TextAlign? textAlign,FontWeight? fontWeight}) {
    return Text(
      text??'',
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 14,
        fontWeight: fontWeight??FontWeight.w500,
        color: color ?? AppColor.black_2,
      ),
    );
  }

  static Widget smallHeadingText(
      {required String text, double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 12,
        // fontWeight: FontWeight.w900,
        color: color ?? AppColor.black_2,
      ),
    );
  }

  static Widget boldSubHeadingText(
      {required String text,
        double? textSize,
        Color? color,
        TextAlign? textAlign}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 16,
        fontWeight: FontWeight.w900,
        color: color ?? AppColor.black_2,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }



  static AppBar customAppBar({String? text,Color? color,bool? isCenter = false,IconData? icon,Color? textColor,Color? iconColor,void Function()? onTap}) {
    return AppBar(
      backgroundColor: color ?? Colors.teal,
      title:  Text(text??"",style: TextStyle(color: textColor ?? Colors.white),),
      centerTitle: isCenter == false ? true : false,
      leading: isCenter == false ? InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.arrow_back_ios_outlined,
        ),
      ) : Container(),
      actions:  [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            icon,
            color: iconColor ?? AppColor.white,
          ),
        ),
      ],
    );
  }

  static Widget customAppBarNew({required BuildContext context}){
    return CustomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 30, left: 20, right: 16, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child
                      : const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColor.white,
                  ),
                ),
                const Text(UtilStrings.smartX,
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                const Icon(
                  Icons.info_outlined,
                  color: AppColor.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

static Widget customVerticalDivider(){
    return Container(
      child: VerticalDivider(
        color: AppColor.grey,
        width: 1,
      ),
    );
}
static Widget customIcon({IconData? icon,Color? color,double? size}){
    return Icon(icon,color: color ?? Colors.black,size: size ?? 20,);
}
  static Widget customDivider({double? indent, double? endent}) {
    return Divider(
      thickness: 1,
      height: 2,
      indent: indent ?? 0,
      endIndent: endent ?? 0,
    );
  }


}