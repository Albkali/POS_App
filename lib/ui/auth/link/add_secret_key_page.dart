import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/api_end_points.dart';
import 'package:pos/utils/constants/custom_button.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_text_filed.dart';
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
  // final authorizationEndpoint =
  // Uri.parse("http://example.com/oauth2/authorization");
  // final tokenEndpoint =
  // Uri.parse("http://example.com/oauth2/token");
  // final identifier = "my client identifier";
  // final secret = "my client secret";
  // final credentialsFile = File("~/.myapp/credentials.json");
  // final redirectUrl = Uri.parse("http://my-site.com/oauth2-redirect");
  // Future<oauth2.Client> getClient() async {
  //   var exists = await credentialsFile.exists();
  //
  //   if (exists) {
  //     var credentials = oauth2.Credentials.fromJson(
  //         await credentialsFile.readAsString());
  //     return oauth2.Client(credentials,
  //         identifier: identifier, secret: secret);
  //   }
  //   var grant = oauth2.AuthorizationCodeGrant(
  //       identifier, authorizationEndpoint, tokenEndpoint,
  //       secret: secret);
  //
  //   await redirect(grant.getAuthorizationUrl(redirectUrl));
  //
  //   // Another imaginary function that listens for a request to `redirectUrl`.
  //   var request = await listen(redirectUrl);
  //   var client = await loadClient();
  //
  //   // Once the user is redirected to `redirectUrl`, pass the query parameters to
  //   // the AuthorizationCodeGrant. It will validate them and extract the
  //   // authorization code to create a new Client.
  //   return await grant.handleAuthorizationResponse(request.uri.queryParameters);
  // }
  void checkData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   String? screatKey = preferences.getString(PrefKeyConstants.SECRET_KEY);
    String? baseUrl =  preferences.getString(PrefKeyConstants.BASE_URL);
    print('SECRET KEY ----> ${screatKey}');
    print('S KEY ----> ${baseUrl}');
    if(screatKey == keyController.text && baseUrl == tokenController.text){
      Navigator.push(context, MaterialPageRoute(builder: (builder)=> LoginPage()));
    }
    else{
        print('Worng Creditial.......');
    }
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
                  title: 'Enter Secret Key',
                  // title:getTranslated(context, UtilStrings.userName) ,
                  textEditingController: keyController,
                ),
                const Gap(20),
                CustomTextFiled(
                  isPreffixIcon: true,
                  isContentPedding: true,
                  title: 'Enter Auth Key',
                  // title:getTranslated(context, UtilStrings.userName) ,
                  textEditingController: tokenController,
                ),
                // CustomTextFiled(hintText: hintText, controller: controller)
               // CustomTextFiled(hintText: 'Enter Secret Key', controller: keyController),
               //  const Gap(20),
               //  CustomTextFiled(hintText: 'Enter Auth Token Key', controller: keyController),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: (){
              if(keyController.text.isEmpty && tokenController.text.isEmpty){
                ToastUtils.showCustomToast(context, 'Please Enter Client Secret Key', 'warning');
              }else{
                setString(PrefKeyConstants.SECRET_KEY, keyController.text);
                setString(PrefKeyConstants.BASE_URL, tokenController.text);
                // checkData();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return const LoginPage();
                }));
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
