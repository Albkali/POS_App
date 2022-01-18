import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/choose_language/choose_language_page.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/custom_app_bar.dart';

class SettingPage extends StatefulWidget {
  bool? isLanguagePage;

  SettingPage({Key? key, this.isLanguagePage = false}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.teal.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 16, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Gap(20),
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage('https://us.123rf.com/450wm/fizkes/fizkes2007/fizkes200701793/152407909-profile-picture-of-smiling-young-caucasian-man-in-glasses-show-optimism-positive-and-motivation-head.jpg?ver=6'),
                    ),
                    const Gap(10),
                    const Text('Yaseer Albkali',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const Gap(10),
                    Utils.mediumHeadingText(
                        text: 'Yasser@gmaill.com', color: Colors.white),
                    const Gap(10),
                    Utils.mediumHeadingText(
                        text: 'Points:745.0', color: Colors.white),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Utils.boldSubHeadingText(text: 'Dark Theme'),
                  CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            commonListTile(
                title: 'My Order',
                icon:   Icons.shopping_bag_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Profile',
                icon:   Icons.person_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Address',
                icon:   Icons.location_on_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Message',
                icon:   Icons.chat_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Coupon',
                icon:   Icons.local_offer_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Language',
                icon:   Icons.local_offer_outlined,
                onTap: () {              Navigator.push(context, MaterialPageRoute(builder: (builder)=> ChooseLanguagePage(isLanguage: true,)));
                }),
            commonListTile(
                title: 'Help & Support',
                icon: Icons.contact_support_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Privacy & Policy',
                icon: Icons.policy_outlined,
                onTap: () {}),
            commonListTile(
                title: 'Terms & Condition',
                icon: Icons.receipt_long_outlined,
                onTap: () {}),
            commonListTile(
                title: 'About Us',
                icon: Icons.info_outlined,
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget commonListTile(
      {required title, required IconData icon, required Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Utils.boldSubHeadingText(text: title, textAlign: TextAlign.start),
      trailing: null,
    );
  }
}
