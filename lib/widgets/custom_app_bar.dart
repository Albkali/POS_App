import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic child;
  const CustomAppBar({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColor.sky_grey,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        width: Utils.getHeight(context),
        child: child,
    );
  }
}
