import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';

class AddNewContactPage extends StatefulWidget {
  const AddNewContactPage({Key? key}) : super(key: key);

  @override
  State<AddNewContactPage> createState() => _AddNewContactPageState();
}

class _AddNewContactPageState extends State<AddNewContactPage> {
  @override
  Widget build(BuildContext context) {
    bool _value = false;
    int? val = 1;
    bool isSelected= true;
    return Scaffold(
      appBar: Utils.customAppBar(text: UtilStrings.addNewContact,
          color: Colors.white,
          isCenter: true,
          icon: Icons.clear,
          textColor: Colors.black,
          iconColor: AppColor.grey2),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int?;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  Utils.mediumHeadingText(text: 'Business'),
                ],
              ),
              customNewContactTextFiled(title: '${UtilStrings.contactId} : ',
                  icon: Icons.person,
                  subTitle: UtilStrings.contactId),
              const Gap(10),
              customNewContactTextFiled(
                  title: '${UtilStrings.customerGroup} : ',
                  icon: Icons.person,
                  subTitle: 'None'),
              const Gap(10),
              customNewContactTextFiled(title: '${UtilStrings.businessName} : ',
                  icon: Icons.person,
                  subTitle: UtilStrings.businessName),
              const Gap(10),
              customNewContactTextFiled(title: '${UtilStrings.mobile} : ',
                  icon: Icons.person,
                  subTitle: UtilStrings.mobile),
              const Gap(10),
              Center(child: Container(width: 190,
                  child: SmallCustomButtonWithIcon(label: 'More Information',
                    bgcolor: AppColor.blue,
                    textColor: AppColor.white,
                    iconColor: AppColor.white,
                    icon: Icons.keyboard_arrow_down_outlined,
                    onTap: (){
                    print('Check it... Button');
                    setState(() {
                      isSelected = !isSelected;
                    });
                    },))),
              const Gap(10),
              isSelected == true?  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customNewContactTextFiled(title: '${UtilStrings.taxNumber} : ',
                      icon: Icons.person,
                      subTitle: UtilStrings.taxNumber),
                  const Gap(10),
                  customNewContactTextFiled(
                      title: '${UtilStrings.openingBalance} : ',
                      icon: Icons.person,
                      subTitle: UtilStrings.openingBalance),
                  const Gap(10),
                  customNewContactTextFiled(title: '${UtilStrings.payTerm} : ',
                      icon: Icons.person,
                      subTitle: UtilStrings.payTerm),
                  const Gap(10),
                  customNewContactTextFiled(title: '${UtilStrings.creditLimit} : ',
                      icon: Icons.person,
                      subTitle: UtilStrings.creditLimit),
                  const Gap(10),
                  Utils.mediumHeadingText(text: '${UtilStrings.addressLineNo1} : '),
                  const Gap(5),
                  const ContainerBorder(
                    child: CustomTextFiled(
                      title: UtilStrings.addressLineNo1,
                      isContentPedding: true,
                    ),
                  ),
                  const Gap(10),
                  Utils.mediumHeadingText(text: '${UtilStrings.addressLineNo2} : '),
                  const Gap(5),
                  const ContainerBorder(
                    child: CustomTextFiled(
                      title: UtilStrings.addressLineNo2,
                      isContentPedding: true,
                    ),
                  ),
                  const Gap(10),
                ],
              ) : SizedBox(),


            ],
          ),
        ),
      ),
      ),
    );
  }

   static customNewContactTextFiled(
      {required String? title, required IconData? icon, required String? subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.mediumHeadingText(text: title.toString()),
        const Gap(5),
        Container(
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.grey2,),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(icon),
                const Gap(5),
                Utils.customVerticalDivider(),
                const Gap(5),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: subTitle,
                      hintStyle: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        // fontWeight: FontWeight.w900,
                        color: AppColor.black_2,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
