import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/language_model.dart';
import 'package:pos/localization/language_constrants.dart';
import 'package:pos/main.dart';
import 'package:pos/ui/auth/link/add_secret_key_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/custom_button.dart';
import 'package:pos/utils/images_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_app_bar.dart';

class ChooseLanguagePage extends StatefulWidget {
  bool?isLanguage;
   ChooseLanguagePage({Key? key,this.isLanguage=true}) : super(key: key);

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) async {
      Locale _locale = await setLocale(language.languageCode);
      MyApp.setLocale(context, _locale);
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomAppBar(
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //         top: 30, left: 20, right: 16, bottom: 20),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         const Gap(20),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: const [
          //             Text('Choose Language',
          //                 style: TextStyle(
          //                     color: Colors.yellowAccent,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold)),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const Gap(80),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Utils.boldSubHeadingText(text: 'Choose the Language',textSize: 25),
          ),
          const Gap(30),
          commonText(title: 'India',flag: AppImages.indiaFlag,index: 0),
          const Gap(10),
          commonText(title: 'عربى',flag: AppImages.arabicFlag,index: 1),
          // DropdownButton<Language>(
          //   onChanged: (Language? language) {
          //     _changeLanguage(language!);
          //   },
          //   underline: const SizedBox(),
          //   items: Language.languageList()
          //       .map<DropdownMenuItem<Language>>((value) {
          //     return DropdownMenuItem<Language>(
          //       value: value,
          //       child: Row(
          //         children: [
          //           Text(
          //             value.flag,
          //             style: const TextStyle(
          //                 fontSize: 12, fontWeight: FontWeight.w400),
          //           ),
          //           Text(
          //             value.name,
          //             style: const TextStyle(
          //                 fontSize: 12, fontWeight: FontWeight.w400),
          //           ),
          //         ],
          //       ),
          //     );
          //   }).toList(),
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: InkWell(
              onTap: (){
                if(widget.isLanguage == true){
                  Navigator.pop(context);
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> AddSecretKey()));
                }
              },
              child: const CustomButton(
                title: 'Save',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commonText({required flag,required String title,Function()? onTap,int index=0}) {
    return InkWell(
      onTap: (){
        setState(() {
          selectedIndex = index;
          print('Index --> ${index}');
        });
      },
      child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == index ? AppColor.light_sky_blue.withOpacity(0.2) : Colors.transparent,
              border: Border.symmetric(horizontal: BorderSide(color:selectedIndex == index ? AppColor.sky_blue : Colors.transparent)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child: Row(
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      child: Image.asset(flag)),
                Gap(10),
                  Utils.mediumHeadingText(text: title,textSize: 15,fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
    );
  }
}
