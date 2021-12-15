import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal,
      appBar: Utils.customAppBar(text: UtilStrings.smartX,icon: Icons.info_outlined),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Container(
            margin: const EdgeInsets.only(left: 20),
              height: 30,
              width: 120,
              color: Colors.white,
               alignment: Alignment.centerLeft,
               child: Padding(
                 padding: const EdgeInsets.only(left: 5,right: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Utils.regularHeadingText(text: 'English',textSize: 14),
                     const Icon(
                       Icons.unfold_more_outlined,
                     ),
                   ],
                 ),
               ),
            ),
            const Gap(50),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.regularHeadingText(text: UtilStrings.login,color: AppColor.white),
                  const Gap(20),
                  const CustomTextFiled(title: UtilStrings.userName,icon: Icons.person_outlined,),
                  const Gap(20),
                  const CustomTextFiled(title: UtilStrings.password,icon: Icons.lock,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(value: checkBoxValue,
                          activeColor: Colors.green,
                          onChanged:(bool? newValue){
                            setState(() {
                              checkBoxValue = newValue;
                            });
                          }),
                     Utils.mediumHeadingText(text: UtilStrings.rememberMe,color: AppColor.white),
                    ],
                  ),
                  const Gap(10),
                  Container(
                    height: 35,
                    width: 150,
                    color: AppColor.blue,
                    alignment: Alignment.center,
                    child: Utils.mediumHeadingText(text: UtilStrings.login,color: AppColor.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
