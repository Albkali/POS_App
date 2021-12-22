import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';
import 'package:provider/provider.dart';

import 'add_new_contact_view_model.dart';

class AddNewContactPage extends StatefulWidget {
  const AddNewContactPage({Key? key}) : super(key: key);

  @override
  State<AddNewContactPage> createState() => _AddNewContactPageState();
}

class _AddNewContactPageState extends State<AddNewContactPage> {
  bool _value = false;
  int? val = 1;
  bool isSelected = false;
  TextEditingController businessNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController openingBalanceController = TextEditingController();
  TextEditingController payTermNumberController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();
  TextEditingController customerGroupIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () async {
            ReqContact m = ReqContact(
              type: 'business',
              supplierBusinessName: businessNameController.text.toString(),
              prefix: '',
              firstName: firstNameController.text.toString(),
              middleName: '',
              lastName: '',
              taxNumber: taxNumberController.text.toString(),
              payTermNumber: payTermNumberController.text.toString(),
              payTermType: '',
              mobile: mobileController.text.toString(),
              landline: '',
              alternateNumber: '',
              addressLine1: addressLine1Controller.text.toString(),
              addressLine2: addressLine2Controller.text.toString(),
              city: '',
              state: '',
              country: '',
              zipCode: '',
              customerGroupId: '',
              contactId: contactIdController.text.toString(),
              // dob: '',
              customField1: '',
              customField2: '',
              customField3: '',
              customField4: '',
              email: '',
              shippingAddress: '',
              position: '',
              openingBalance: openingBalanceController.text.toString(),
              sourceId: '',
              lifeStageId: '',
              // assignedTo: ''
            );
            showLoadingDialog(context: context);
            Provider.of<AddNewContactViewModel>(context, listen: false)
                .addContact(m, context);
          },
          child: Container(
              height: 40,
              color: AppColor.blue,
              child: Center(
                  child: Utils.boldSubHeadingText(
                      text: 'Submit', color: AppColor.white))),
        ),
      ),
      appBar: Utils.customAppBar(
          text: UtilStrings.addNewContact,
          color: Colors.white,
          isCenter: true,
          icon: Icons.clear,
          textColor: Colors.black,
          iconColor: AppColor.grey2),
      body: SafeArea(
        child: Padding(
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
                customNewContactTextFiled(
                    title: '${UtilStrings.contactId} : ',
                    icon: Icons.person,
                    subTitle: UtilStrings.contactId,
                    controller: contactIdController),
                const Gap(10),
                customNewContactTextFiled(
                  title: '${UtilStrings.customerGroup} : ',
                  icon: Icons.person,
                  subTitle: 'None',
                  controller: customerGroupIdController
                ),
                const Gap(10),
                customNewContactTextFiled(
                    controller: businessNameController,
                    title: '${UtilStrings.businessName} : ',
                    icon: Icons.person,
                    subTitle: UtilStrings.businessName),
                const Gap(10),
                customNewContactTextFiled(
                    controller: firstNameController,
                    title: '${UtilStrings.firstName} : ',
                    icon: Icons.person,
                    subTitle: UtilStrings.firstName),
                const Gap(10),
                customNewContactTextFiled(
                    controller: mobileController,
                    title: '${UtilStrings.mobileNo} : ',
                    icon: Icons.person,
                    subTitle: UtilStrings.mobileNo),
                const Gap(10),
                Center(
                    child: Container(
                        width: 190,
                        child: SmallCustomButtonWithIcon(
                          label: 'More Information',
                          bgcolor: AppColor.blue,
                          textColor: AppColor.white,
                          iconColor: AppColor.white,
                          icon: Icons.keyboard_arrow_down_outlined,
                          onTap: () {
                            print('Check it... Button ${isSelected}');
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                        ))),
                const Gap(10),
                isSelected == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customNewContactTextFiled(
                              title: '${UtilStrings.taxNumber} : ',
                              icon: Icons.person,
                              subTitle: UtilStrings.taxNumber,
                          controller: taxNumberController),
                          const Gap(10),
                          customNewContactTextFiled(
                              title: '${UtilStrings.openingBalance} : ',
                              icon: Icons.person,
                              subTitle: UtilStrings.openingBalance,
                          controller: openingBalanceController),
                          const Gap(10),
                          customNewContactTextFiled(
                              title: '${UtilStrings.payTerm} : ',
                              icon: Icons.person,
                              subTitle: UtilStrings.payTerm,
                          controller: payTermNumberController),
                          const Gap(10),
                          customNewContactTextFiled(
                              title: '${UtilStrings.creditLimit} : ',
                              icon: Icons.person,
                              subTitle: UtilStrings.creditLimit),
                          const Gap(10),
                          Utils.mediumHeadingText(
                              text: '${UtilStrings.addressLineNo1} : '),
                          const Gap(5),
                          const ContainerBorder(
                            child: CustomTextFiled(
                              title: UtilStrings.addressLineNo1,
                              isContentPedding: true,
                            ),
                          ),
                          const Gap(10),
                          Utils.mediumHeadingText(
                              text: '${UtilStrings.addressLineNo2} : '),
                          const Gap(5),
                          const ContainerBorder(
                            child: CustomTextFiled(
                              title: UtilStrings.addressLineNo2,
                              isContentPedding: true,
                            ),
                          ),
                          const Gap(10),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static customNewContactTextFiled(
      {required String? title,
      required IconData? icon,
      required String? subTitle,
      TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.mediumHeadingText(text: title.toString()),
        const Gap(5),
        Container(
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.grey2,
            ),
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
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: subTitle,
                      hintStyle: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        // fontWeight: FontWeight.w900,
                        color: AppColor.black_2,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
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
