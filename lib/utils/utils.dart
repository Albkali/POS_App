import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget regularHeadingText(
      {required String text, double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 18,
        fontWeight: FontWeight.w300,
        color: color ?? AppColor.black_2,
      ),
    );
  }

  static Widget mediumHeadingText(
      {required String text, double? textSize, Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'DMSans',
        fontSize: textSize ?? 14,
        // fontWeight: FontWeight.w900,
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



  static AppBar customAppBar({required String text,Color? color,bool? isCenter = false,IconData? icon,Color? textColor,Color? iconColor}) {
    return AppBar(
      elevation: isCenter == false ? 5 : 1,
      backgroundColor: color ?? Colors.teal,
      title:  Text(text,style: TextStyle(color: textColor ?? Colors.white),),
      centerTitle: isCenter == false ? true : false,
      leading: isCenter == false ? const Icon(
        Icons.arrow_back_ios_outlined,
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