import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/contact/req_contact.dart';
import 'package:pos/localization/language_constrants.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
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
                    top: 5,
                    left: 22,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Color(0xff78909c),
                            ),
                          ),
                          const Gap(90),
                          Row(
                            children: const [
                              Text('Add New Contact',
                                  style: TextStyle(
                                      color: Color(0xff004d40),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
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
                        Utils.mediumHeadingText(text: getTranslated(context, UtilStrings.business)),
                      ],
                    ),
                    customNewContactTextFiled(
                        title: '${getTranslated(context, UtilStrings.contactId)} : ',
                        icon: Icons.account_circle,
                        subTitle: getTranslated(context, UtilStrings.contactId),
                        controller: contactIdController),
                    const Gap(10),
                    customNewContactTextFiled(
                        title: '${getTranslated(context, UtilStrings.customerGroup)} : ',
                        icon: Icons.people,
                        subTitle: getTranslated(context, UtilStrings.none),
                        controller: customerGroupIdController
                    ),
                    const Gap(10),
                    customNewContactTextFiled(
                        controller: businessNameController,
                        title: '${getTranslated(context, UtilStrings.businessName)} : ',
                        icon: Icons.work,
                        subTitle: getTranslated(context, UtilStrings.businessName)),
                    const Gap(10),
                    customNewContactTextFiled(
                        controller: firstNameController,
                        title: '${getTranslated(context, UtilStrings.firstName)} : ',
                        icon: Icons.person,
                        subTitle: getTranslated(context, UtilStrings.firstName)),
                    const Gap(10),
                    customNewContactTextFiled(
                        controller: mobileController,
                        title: '${getTranslated(context, UtilStrings.mobileNo)} : ',
                        icon: Icons.settings_phone,
                        subTitle: getTranslated(context, UtilStrings.mobileNo)),
                    const Gap(15),
                    Center(
                        child: Container(
                          height: 40,
                          width: 170,
                          // width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.amber,
                          ),
                          child: SmallCustomButtonWithIcon(
                            isTagType: true,
                            label: getTranslated(context, UtilStrings.moreInfirmation),
                            textColor: AppColor.black,
                            iconColor: AppColor.black,
                            icon: Icons.keyboard_arrow_down_outlined,
                            onTap: () {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                        )),
                    const Gap(10),
                    isSelected == true
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customNewContactTextFiled(
                            title: '${UtilStrings.taxNumber} : ',
                            icon: Icons.timer_10,
                            subTitle: UtilStrings.taxNumber,
                            controller: taxNumberController),
                        const Gap(10),
                        customNewContactTextFiled(
                            title: '${UtilStrings.openingBalance} : ',
                            icon: Icons.payments,
                            subTitle: UtilStrings.openingBalance,
                            controller: openingBalanceController),
                        const Gap(10),
                        customNewContactTextFiled(
                            title: '${UtilStrings.payTerm} : ',
                            icon: Icons.paid,
                            subTitle: UtilStrings.payTerm,
                            controller: payTermNumberController,
                        ),
                        const Gap(10),
                        customNewContactTextFiled(
                            title: '${UtilStrings.creditLimit} : ',
                            icon: Icons.credit_card,
                            subTitle: UtilStrings.creditLimit),
                        const Gap(10),
                      ],
                    )
                        : SizedBox(),
                    const Gap(10),
                  ],
                ),
              ),

              Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0d47a1),
                  ),
                  child: InkWell(
                    onTap: (){
                      print("DATA IS ${mobileController.text.toString()}");
                      print("DATA IS ${businessNameController.text.toString()}");
                      print("DATA IS ${firstNameController.text.toString()}");
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
                    child: SmallCustomButtonWithIcon(
                      label: 'Add',
                      bgcolor: const Color(0xff0d47a1),
                      textColor: AppColor.white,
                    ),
                  )),
            ],
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
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColor.grey2,
            blurRadius: 20.0,
          ),
        ],
        color: AppColor.white,
        border: Border.all(color: AppColor.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: const SizedBox(),
          border: InputBorder.none,
          hintText: subTitle,
          hintStyle: const TextStyle(
            fontFamily: 'DMSans',
            fontSize: 15,
            // fontWeight: FontWeight.w900,
            color: AppColor.grey,
          ),
          // contentPadding: const EdgeInsets.symmetric(
          //     vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
