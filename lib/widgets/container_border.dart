import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';

class ContainerBorder extends StatelessWidget {
  final Widget? child;
  final double? height;
  const ContainerBorder({Key? key,this.child,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 35,
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey2,),
      ),
    );
  }
}
