import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pos/localization/language_constrants.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_page.dart';
import 'package:pos/ui/pos/pos_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell.dart';
import 'package:pos/ui/setting_page/setting_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();

  double x = 0.9;

  double y = 0.2;

  double z = 0.0;

  List iconList = [
    Icons.payment_outlined,
    Icons.contacts_outlined,
    Icons.paid_outlined,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    List textList = [getTranslated(context, UtilStrings.pos), getTranslated(context, UtilStrings.addContact), getTranslated(context, UtilStrings.sale),'Setting'];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// custom AppBar...
                  Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: AppColor.sky_grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    width: Utils.getHeight(context),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 16, right: 16, bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.menu),
                              const Gap(10),
                              Row(
                                children: const [
                                  Text('Divllo',
                                      style: TextStyle(
                                          color: Colors.yellowAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Gap(5),
                                  Text('',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:  TextField(
                              // controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColor.grey,
                                ),
                                border: InputBorder.none,
                                // labelText: 'User Name',
                                hintStyle: const TextStyle(
                                  color: AppColor.grey,
                                ),
                                hintText: getTranslated(context, UtilStrings.searchForService),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      height: Utils.getHeight(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              commonCircleWithText(
                                text: getTranslated(context, UtilStrings.home),
                                icon: Icons.phone_android_outlined,
                              ),
                              commonCircleWithText(
                                text: getTranslated(context, UtilStrings.quotation),
                                icon: Icons.description_outlined,
                              ),
                              commonCircleWithText(
                                text: getTranslated(context, UtilStrings.customer),
                                icon: Icons.group_outlined,
                              ),
                              commonCircleWithText(
                                text: '',
                                icon: Icons.local_atm_outlined,
                              ),
                            ],
                          ),
                          Container(
                            constraints: BoxConstraints.expand(
                              height: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .fontSize! *
                                  3.5 +
                                  500.0,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              color: Colors.yellow.withOpacity(0.2),
                            ),
                            alignment: Alignment.center,
                            transform: Matrix4(
                              1,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              1,
                              0,
                              0,
                              0,
                              0,
                              1,
                            )
                              ..rotateX(x)
                              ..rotateY(y)
                              ..rotateZ(z),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 280,
                left: 20,
                right: 20,
                child: SizedBox(
                  height: 400,
                  width: 350,
                  // color: AppColor.green,
                  child: Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 5.9 / 4.6,
                              crossAxisSpacing: 20.0,
                          mainAxisSpacing: 30.0),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            if (index == 0) {
                              showLoadingDialog(context: context);
                              await Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .userDetails(context: context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PosPage(),
                                ),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AddNewContactPage(),
                                ),
                              );
                            }
                            else if (index == 2) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ListOfSellPage();
                              }));
                            } else if (index == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingPage(),
                                ),
                              );
                            } else if (index == 4) {} else if (index == 5) {} else if (index == 6) {} else if (index == 7) {} else if (index == 8) {}
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 5),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.grey2,
                                    offset: Offset(-1.0, 10),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                                border: Border.all(color: AppColor.grey),
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    iconList[index],
                                    size: 35,
                                  ),
                                  const Gap(4),
                                  Utils.mediumHeadingText(
                                      text: textList[index], textSize: 15),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonCircleWithText({required String? text,
    required IconData? icon,
    void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.grey, width: 1)),
            child: Icon(icon),
          ),
          const Gap(3),
          Utils.mediumHeadingText(text: text.toString()),
        ],
      ),
    );
  }
}
