import 'package:flutter/material.dart';
import 'package:pos/utils/color_utils.dart';

class CustomTextFiled extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool? isContentPedding;
  const CustomTextFiled({Key? key,this.title,this.icon,this.isContentPedding = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: 35,
      color: AppColor.white,
      child:  TextField(
        decoration: InputDecoration(
          contentPadding: isContentPedding == false ?  EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 10) : EdgeInsets.only(top: 0,left: 10,right: 0,bottom: 15),
          border: InputBorder.none,
          suffixIcon: Icon(
            icon,
            color: Colors.teal,
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          // labelText: 'User Name',
          hintText: title,
        ),
      ),
    );
  }
}
