import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_sell_textfiled.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';

class ReturnSellPage extends StatelessWidget {
  const ReturnSellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  UtilStrings.sellReturn,
                  style: TextStyle(fontSize: 22),
                ),
                const Gap(10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils.regularHeadingText(text: UtilStrings.parentSale),
                        const Gap(20),
                        customText(
                            title: '${UtilStrings.invoiceNumber}: ',
                            subTitle: '0049'),
                        const Gap(3),
                        customText(
                            title: '${UtilStrings.date}: ',
                            subTitle: '12/11/2021'),
                        const Gap(3),
                        customText(
                            title: '${UtilStrings.customer}: ',
                            subTitle: 'Walk-In Customer'),
                        const Gap(3),
                        customText(
                            title: '${UtilStrings.businessLocation}: ',
                            subTitle: 'Restaurant'),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils.mediumHeadingText(
                            text: '${UtilStrings.invoiceNumber}:'),
                        const Gap(5),
                        const ContainerBorder(
                            child: CustomTextFiled(
                          title: '',
                        )),
                        const Gap(10),
                        Utils.mediumHeadingText(text: '${UtilStrings.date}:*'),
                        const Gap(5),
                        const CustomSellTextFiled(
                          iconLeft: Icons.calendar_today_outlined,
                          title: '12/15/2021',
                          isRightVisible: true,
                        ),
                        const Gap(10),
                        const Text(
                          'TABLE',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Gap(10),
                        Utils.boldSubHeadingText(
                            text: UtilStrings.discountType, textSize: 14),
                        const Gap(3),
                        const ContainerBorder(
                          child: CustomTextFiled(
                            title: 'Percentage',
                            isContentPedding: true,
                          ),
                        ),
                        const Gap(10),
                        Utils.boldSubHeadingText(
                            text: UtilStrings.discountAmount, textSize: 14),
                        const Gap(3),
                        const ContainerBorder(
                          child: CustomTextFiled(
                            title: '0.00',
                            isContentPedding: true,
                          ),
                        ),
                        const Gap(15),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  title: 'Total Return Discount:',
                                  subTitle: '(-) 0.00'),
                              const Gap(3),
                              customText(
                                  title: 'Total Return Tax -:',
                                  subTitle: '(+) 0.00'),
                              const Gap(3),

                              customText(
                                  title: 'Return Total:', subTitle: '0.00'),
                              const Gap(15),
                              SizedBox(
                                  width: 100,
                                  child: SmallCustomButtonWithIcon(
                                    label: 'Save',
                                    textColor: AppColor.white,
                                    bgcolor: AppColor.blue,
                                    isLeft: false,
                                    isTagType: false,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row customText({required String? title, required String? subTitle}) {
    return Row(
      children: [
        Utils.boldSubHeadingText(text: title.toString(), textSize: 14),
        const Gap(5),
        Utils.mediumHeadingText(text: subTitle.toString()),
      ],
    );
  }
}
