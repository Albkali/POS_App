import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/models/sell/show_sell/res_show_sell.dart';
import 'package:pos/ui/sell/return_sell/return_sell_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/common_methods.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_sell_textfiled.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';
import 'package:provider/provider.dart';

class ReturnSellPage extends StatefulWidget {
  final SellItem item;
  const ReturnSellPage({Key? key,required this.item}) : super(key: key);

  @override
  State<ReturnSellPage> createState() => _ReturnSellPageState();
}

class _ReturnSellPageState extends State<ReturnSellPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController discountController = TextEditingController();
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
                            subTitle: widget.item.invoiceNo),
                        const Gap(3),
                        customText(
                            title: '${UtilStrings.date}: ',
                            subTitle: DateFormat('dd/MM/yyyy').format(widget.item.transactionDate)),
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
                    child: SingleChildScrollView(
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
                          InkWell(
                            onTap: () async{
                              final DateTime? picked = await pickDate(
                                context: context,
                                initialDate: dateController.text.isNotEmpty
                                    ? DateFormat('dd-MM-yyyy').parse(dateController.text)
                                    : DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null) {
                                final DateFormat formatter = DateFormat('dd-MM-yyyy');
                                final String formatted = formatter.format(picked);
                                dateController.text = formatted;
                              }
                              print('Your date is  ${dateController.text}');
                            },
                            child:  IgnorePointer(
                              child: CustomSellTextFiled(
                                controller: dateController,
                                iconLeft: Icons.calendar_today_outlined,
                                title: dateController.text.toString(),
                                isRightVisible: true,
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.light_grey)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child:box(
                                            title: 'Product Name',subTitle: 'ABC',
                                          )),
                                          Expanded(child:box(
                                            title: 'Unit price',subTitle: '50',
                                          )),
                                        ],
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          Expanded(child:box(
                                            title: 'Sell Quantity',subTitle: 'ABC',
                                          )),
                                          Expanded(child:box(
                                            title: 'Return Quantity',subTitle: 'ABC',
                                          )),
                                        ],
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          Expanded(child:box(
                                            title: 'Return SubTotal',subTitle: 'ABC',
                                          )),
                                        ],
                                      ),

                                    ],
                                  ),
                                );
                              },),
                          ),
                          const Gap(10),
                          Utils.boldSubHeadingText(
                              text: UtilStrings.discountType, textSize: 14),
                          Consumer<ReturnSellViewModel>(
                            builder: (BuildContext context, value, Widget? child) {
                              return DropdownButton<String>(
                                value: value.selectrange,
                                items: <String>[
                                   'Fixed',
                                  'Percentage',
                                ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      );
                                    }).toList(),
                                onChanged: (String? val) async {
                                  value.selectrange = val ?? '';
                                  value.notifyListeners();
                                },
                              );
                            },),
                          const Gap(10),
                          Utils.boldSubHeadingText(
                              text: UtilStrings.discountAmount, textSize: 14),
                          const Gap(3),
                           ContainerBorder(
                            child: CustomTextFiled(
                              textEditingController: discountController,
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
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
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

  Widget box({required String title,  required String subTitle}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.mediumHeadingText(text: title),
        Utils.boldSubHeadingText(text: subTitle),
      ],
    );
  }

}
