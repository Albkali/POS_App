import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/provider/auth_provider.dart';
import 'package:pos/provider/sell_list_provider.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/navigation_route_constants.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? checkBoxValue = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: Utils.customAppBar(
          text: UtilStrings.smartX, icon: Icons.info_outlined),
      body: Column(
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
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.regularHeadingText(text: 'English', textSize: 14),
                  const Icon(
                    Icons.unfold_more_outlined,
                  ),
                ],
              ),
            ),
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.regularHeadingText(
                    text: UtilStrings.login, color: AppColor.white),
                const Gap(20),
                CustomTextFiled(
                  title: UtilStrings.userName,
                  icon: Icons.person_outlined,
                  textEditingController: emailController,
                ),
                const Gap(20),
                CustomTextFiled(
                  title: UtilStrings.password,
                  icon: Icons.lock,
                  textEditingController: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.green,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checkBoxValue = newValue;
                          });
                        }),
                    Utils.mediumHeadingText(
                        text: UtilStrings.rememberMe, color: AppColor.white),
                  ],
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      ToastUtils.showCustomToast(context, 'Please Enter Email', 'warning');
                    } else if (passwordController.text.isEmpty) {
                      ToastUtils.showCustomToast(context, 'Please Enter Password', 'warning');

                    } else {
                      context
                          .read<AuthProvider>()
                          .login(emailController.text, passwordController.text)
                          .then((value) {
                        if (value.isSuccess) {
                          // Navigator.pushNamedAndRemoveUntil(context, Routes.getHomeRoute(), (route) => false);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                            return HomePage();
                          }), (route) => false);
                        }
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 150,
                    color: AppColor.blue,
                    alignment: Alignment.center,
                    child: Utils.mediumHeadingText(
                        text: UtilStrings.login, color: AppColor.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
