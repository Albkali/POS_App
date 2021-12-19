import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/utils/constants/navigation_route_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';

class AddSecretKey extends StatefulWidget {
  const AddSecretKey({Key? key}) : super(key: key);

  @override
  State<AddSecretKey> createState() => _AddSecretKeyState();
}

class _AddSecretKeyState extends State<AddSecretKey> {
  TextEditingController keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.customAppBar(text: UtilStrings.smartX,icon: Icons.info_outlined),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextField(
                  controller: keyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Secret Key',
                  ),
                ),
              ),
              const Gap(40),
              InkWell(
                onTap: (){
                  if(keyController.text.isEmpty){
                    ToastUtils.showCustomToast(context, 'Please Enter Client Secret Key', 'warning');
                  }else{
                    // setString(PrefKeyConstants.SECRET_KEY, keyController.text);
                    // Navigator.pushNamed(context, Routes.getLoginRoute());
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return LoginPage();
                    }));
                  }
                },
                child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child:
                  Utils.regularHeadingText(text: 'Save', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
