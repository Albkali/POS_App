import 'package:flutter/material.dart';
import 'package:pos/ui/auth/link/add_secret_key_page.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/app_constants.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      print("1-----");
      if (AppConstant.token.isEmpty) {
        print("2-----");

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return AddSecretKey();
        }));
      } else {
        print("3-----");
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        }));
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
    );
  }
}
