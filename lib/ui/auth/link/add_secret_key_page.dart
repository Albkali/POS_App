import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/custom_button.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:oauth2/oauth2.dart' as oauth2;

class AddSecretKey extends StatefulWidget {
  const AddSecretKey({Key? key}) : super(key: key);

  @override
  State<AddSecretKey> createState() => _AddSecretKeyState();
}

class _AddSecretKeyState extends State<AddSecretKey> {
  TextEditingController keyController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  /// oauth2.0.0 Implement....
  void checkData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? screatKey = preferences.getString(PrefKeyConstants.secretKey);
    String? baseUrl = preferences.getString(PrefKeyConstants.baseUrl);
    if (screatKey == keyController.text && baseUrl == tokenController.text) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const LoginPage()));
    } else {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light_white,
      // appBar: Utils.customAppBar(text: UtilStrings.smartX,icon: Icons.info_outlined),
      body: Column(
        children: [
          // Utils.customAppBarNew(context: context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(100),
                CustomTextFiled(
                  isContentPedding: true,
                  isPreffixIcon: true,
                  title: 'Enter Your Id',
                  // title:getTranslated(context, UtilStrings.userName) ,
                  textEditingController: keyController,
                ),
                const Gap(20),
                // CustomTextFiled(
                //   isPreffixIcon: true,
                //   isContentPedding: true,
                //   title: 'Enter Auth Key',
                //   // title:getTranslated(context, UtilStrings.userName) ,
                //   textEditingController: tokenController,
                // ),
                // CustomTextFiled(hintText: hintText, controller: controller)
                // CustomTextFiled(hintText: 'Enter Secret Key', controller: keyController),
                //  const Gap(20),
                //  CustomTextFiled(hintText: 'Enter Auth Token Key', controller: keyController),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (keyController.text.isEmpty && tokenController.text.isEmpty) {
                ToastUtils.showCustomToast(
                    context, 'Please Enter Your Client Id ', 'warning');
              } else {
                // setString(PrefKeyConstants.SECRET_KEY, keyController.text);
                // setString(PrefKeyConstants.BASE_URL, tokenController.text);
                // checkData();
                showLoadingDialog(context: context);
                Provider.of<LoginViewModel>(context, listen: false)
                    .baseUrl(keyController.text, context);
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
              child: CustomButton(
                title: 'Save',
              ),
            ),
          ),
        ],
      ),
    );
  }

}
