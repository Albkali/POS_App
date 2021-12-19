import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/auth/link/add_secret_key_page.dart';
import 'package:pos/utils/constants/navigation_route_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({Key? key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  TextEditingController credentialController = TextEditingController();

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
                  controller: credentialController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Company Credential',
                  ),
                ),
              ),
              const Gap(40),
              InkWell(
                onTap: (){
                  if(credentialController.text.isEmpty){
                    ToastUtils.showCustomToast(context, 'Please Enter Base Url', 'warning');
                  }else{
                    // setString(PrefKeyConstants.BASE_URL, credentialController.text);
                    // Navigator.pushNamed(context, Routes.getScrecretKeyRoute());
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return const AddSecretKey();
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
