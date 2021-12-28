import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/language_model.dart';
import 'package:pos/localization/language_constrants.dart';
import 'package:pos/main.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:provider/provider.dart';

import 'login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? checkBoxValue = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

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
          // Container(
          //   margin: const EdgeInsets.only(left: 20),
          //   height: 30,
          //   width: 120,
          //   color: Colors.white,
          //   alignment: Alignment.centerLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 5, right: 5),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Utils.regularHeadingText(text: 'English', textSize: 14),
          //         const Icon(
          //           Icons.unfold_more_outlined,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          DropdownButton<Language>(
            onChanged: (Language? language) {
              _changeLanguage(language!);
            },
            underline: const SizedBox(),
            // value: ,
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((value) {
              return DropdownMenuItem<Language>(
                value: value,
                child: Row(
                  children: [
                    Text(
                      value.flag,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      value.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const Gap(50),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.regularHeadingText(text: getTranslated(context, UtilStrings.login), color: AppColor.white),
                const Gap(20),
                CustomTextFiled(
                  title:getTranslated(context, UtilStrings.userName) ,
                  icon: Icons.person_outlined,
                  textEditingController: emailController,
                ),
                const Gap(20),
                CustomTextFiled(
                  title: getTranslated(context, UtilStrings.password),
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
                        text: getTranslated(context, UtilStrings.rememberMe), color: AppColor.white),
                  ],
                ),
                const Gap(10),
                InkWell(
                  onTap: () {
                    if (emailController.text.isEmpty) {
                      ToastUtils.showCustomToast(
                          context, getTranslated(context, UtilStrings.enterEmail), 'warning');
                    } else if (passwordController.text.isEmpty) {
                      ToastUtils.showCustomToast(
                          context, getTranslated(context, UtilStrings.enterPassword), 'warning');
                    } else {
                      context
                          .read<LoginViewModel>()
                          .login(emailController.text, passwordController.text)
                          .then((value) {
                        if (value.isSuccess) {
                          // Navigator.pushNamedAndRemoveUntil(context, Routes.getHomeRoute(), (route) => false);
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
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
                        text: getTranslated(context, UtilStrings.login), color: AppColor.white),
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
