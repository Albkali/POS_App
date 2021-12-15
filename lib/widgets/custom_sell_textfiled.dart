import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';

class CustomSellTextFiled extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String? title;
  final bool? isRightVisible;
  const CustomSellTextFiled({Key? key,this.title,this.iconLeft,this.iconRight,this.isRightVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      // margin: EdgeInsets.only(left: 10,right: 10),
      height: 35,
      width: Utils.getWidth(context),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey2),
      ),
      child: Row(
        children: [
          const Gap(10),
          Icon(iconLeft),
          const Gap(10),
          Utils.customVerticalDivider(),
          Expanded(flex: 1,child: CustomTextFiled(title: title,isContentPedding: true,)),
          const Gap(10),

          if(isRightVisible == null)
            ...[
              Utils.customVerticalDivider(),
              const Gap(10),
              Container(height: 22,width: 22,child: Icon(iconRight,color: AppColor.white,size: 20 ,),decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColor.blue,),),
              const Gap(10),
            ]
          else ...[]

        ],
      ),
    );
  }
}
