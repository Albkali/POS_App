import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';

class ContainerBorder extends StatelessWidget {
  final Widget? child;
  const ContainerBorder({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey2,),
      ),
    );
  }
}
