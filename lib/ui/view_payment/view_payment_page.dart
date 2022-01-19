
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';

class ViewPaymentPage extends StatelessWidget {
   ViewPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: Utils.customAppBar(text: 'View Payment(Invoice Number.: 0049',
  color: Colors.white,
  isCenter: true,
  icon: Icons.clear,
  textColor: Colors.black,
  iconColor: AppColor.grey2),
    body: SafeArea(
  child: Padding(
    padding: EdgeInsets.only(left: 20,right: 20,top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Utils.mediumHeadingText(text: '${UtilStrings.customer}: '),
      const Gap(3),
      customText(title: 'Walk-In Customer',subTitle: 'Walk-In Customer'),
      const Gap(20),
      Utils.mediumHeadingText(text: '${UtilStrings.business}: '),
      customText(title: 'Resturant',subTitle: 'Resturant'),
      Utils.mediumHeadingText(text: 'Saudia'),
      Utils.mediumHeadingText(text: 'Saudia,Saudia,Saudia'),
      Utils.mediumHeadingText(text: 'Mobile : 032342342'),
      const Gap(20),
      customText(title: '${UtilStrings.invoiceNumber}: ',subTitle: '#049'),
      const Gap(3),
      customText(title: '${UtilStrings.date}: ',subTitle: '12/11/2021'),
      const Gap(3),
      customText(title: '${UtilStrings.paymentStatus}: ',subTitle: 'Paid'),
      const Gap(3),
      const Text('TABLE',style: TextStyle(fontSize: 20),),
      // Container(
      //   height: 100,
      //   width: Utils.getWidth(context),
      //   color: Colors.green,
      //   padding: EdgeInsets.all(20.0),
      //   child: Table(
      //     border: TableBorder.all(color: Colors.black),
      //     children: [
      //       TableRow(children: [
      //         Text('Cell 1'),
      //         Text('Cell 2'),
      //         Text('Cell 3'),
      //         Text('Cell 3'),
      //         Text('Cell 3'),
      //         Text('Cell 3'),
      //       ]),
      //       TableRow(children: [
      //         Text('Cell 4'),
      //         Text('Cell 5'),
      //         Text('Cell 6'),
      //         Text('Cell 6'),
      //         Text('Cell 6'),
      //         Text('Cell 6'),
      //       ]),
      //     ],
      //   ),
      // ),


    ],
    ),
  ),
  ),
    );
  }

  Row customText({required String? title,required String? subTitle}) {
    return Row(
      children: [
        Utils.boldSubHeadingText(text: title.toString(),textSize: 14),
        const Gap(5),
        Utils.mediumHeadingText(text: subTitle.toString()),
      ],
    );
  }
}
class MultiplicationTableCell extends StatelessWidget {
  final int value;
  final Color? color;
  MultiplicationTableCell({
   required this.value,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.getWidth(context),
      height: 100,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '$value',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}