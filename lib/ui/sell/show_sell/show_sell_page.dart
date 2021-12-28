// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:gap/gap.dart';
// import 'package:pos/utils/color_utils.dart';
// import 'package:pos/utils/string_utils.dart';
// import 'package:pos/utils/utils.dart';
// import 'package:pos/widgets/container_border.dart';
// import 'package:pos/widgets/custom_sell_textfiled.dart';
// import 'package:pos/widgets/custom_text_filed.dart';
// import 'package:pos/widgets/small_custom_button_with_icon.dart';
//
// class ShowSellPage extends StatelessWidget {
//   const ShowSellPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.grey2,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Utils.boldSubHeadingText(text: UtilStrings.location),
//                         Utils.mediumHeadingText(
//                             text: '  Resturant   12/15/2021   09:38'),
//                         const Gap(5),
//                         const Icon(
//                           Icons.keyboard_outlined,
//                         ),
//                       ],
//                     ),
//                     const Gap(15),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           right: 20, top: 0, left: 250, bottom: 0),
//                       child: Container(
//                         height: 30,
//                         width: 30,
//                         color: Colors.red,
//                         child: const Icon(
//                           Icons.clear,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Gap(15),
//               Container(
//                 height: Utils.getHeight(context),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                   child: Column(
//                     children: [
//                       const CustomSellTextFiled(
//                         title: 'Walk-In Customer',
//                         iconLeft: Icons.person,
//                         iconRight: Icons.add,
//                       ),
//                       const Gap(20),
//                       const CustomSellTextFiled(
//                         title: 'Enter Product Name / SKU / Scan BarrCode',
//                         iconLeft: Icons.search,
//                         iconRight: Icons.add,
//                       ),
//                       const Gap(20),
//                       ContainerBorder(
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 10, right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Utils.boldSubHeadingText(
//                                       text: UtilStrings.product, textSize: 14),
//                                   const Gap(4),
//                                   const Icon(
//                                     Icons.info,
//                                     color: AppColor.sky_blue,
//                                     size: 20,
//                                   ),
//                                 ],
//                               ),
//                               const Gap(3),
//                               Utils.customVerticalDivider(),
//                               Utils.boldSubHeadingText(
//                                   text: UtilStrings.quantity, textSize: 14),
//                               Utils.customVerticalDivider(),
//                               Utils.boldSubHeadingText(
//                                   text: UtilStrings.subTotal, textSize: 14),
//                               Utils.customVerticalDivider(),
//                               const Icon(
//                                 Icons.clear,
//                                 size: 20,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//
//                       /// Add Detail Container......
//                       //  Container(
//                       //    height: 70,
//                       //    color: AppColor.grey.withOpacity(0.1),
//                       //    child: Padding(
//                       //      padding: const EdgeInsets.only(left: 10,right: 10),
//                       //      child: Row(
//                       //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //        children: [
//                       //          Utils.smallHeadingText(text: 'BAJA BLACK RAISINS'),
//                       //          Utils.customVerticalDivider(),
//                       //          Expanded(
//                       //            child
//                       //                : Column(
//                       //              children: [
//                       //                ContainerBorder(
//                       //                  child: Row(
//                       //                    children: [
//                       //                      Utils.customIcon(icon: Icons.remove),
//                       //                      Utils.smallHeadingText(text: '1.00'),
//                       //                      Utils.customIcon(icon: Icons.add),
//                       //                    ],
//                       //                  ),
//                       //                ),
//                       //                ContainerBorder(
//                       //                  child: Row(
//                       //                    children: [
//                       //                      Utils.smallHeadingText(text: 'PRICE'),
//                       //                      const Icon(
//                       //                        Icons.keyboard_arrow_down_outlined,
//                       //                      ),
//                       //                    ],
//                       //                  ),
//                       //                ),
//                       //              ],
//                       //            ),
//                       //          ),
//                       //          Utils.customVerticalDivider(),
//                       //          ContainerBorder(
//                       //            child: Utils.smallHeadingText(text: '14.50'),
//                       //          ),
//                       //          Utils.customVerticalDivider(),
//                       //          Icon(Icons.clear),
//                       //
//                       //        ],
//                       //      ),
//                       //    ),
//                       //  ),
//                       //  const Gap(20),
//                       // Center(
//                       //  child: Column(children: <Widget>[
//                       //    Container(
//                       //      margin: EdgeInsets.all(20),
//                       //      child: Table(
//                       //        defaultColumnWidth: FixedColumnWidth(100.0),
//                       //        border: TableBorder.all(
//                       //            color: Colors.black,
//                       //            style: BorderStyle.solid,
//                       //            width: 2),
//                       //        children: [
//                       //          TableRow( children: [
//                       //            Column(children:[Text('Website', style: TextStyle(fontSize: 20.0))]),
//                       //            Column(children:[Text('Tutorial', style: TextStyle(fontSize: 20.0))]),
//                       //            Column(children:[Text('Review', style: TextStyle(fontSize: 20.0))]),
//                       //          ]),
//                       //          TableRow( children: [
//                       //            Column(children:[Text('Javatpoint')]),
//                       //            Column(children:[Text('Flutter')]),
//                       //            Column(children:[Text('5*')]),
//                       //          ]),
//                       //          TableRow( children: [
//                       //            Column(children:[Text('Javatpoint')]),
//                       //            Column(children:[Text('MySQL')]),
//                       //            Column(children:[Text('5*')]),
//                       //          ]),
//                       //          TableRow( children: [
//                       //            Column(children:[Text('Javatpoint')]),
//                       //            Column(children:[Text('ReactJS')]),
//                       //            Column(children:[Text('5*')]),
//                       //          ]),
//                       //        ],
//                       //      ),
//                       //    ),
//                       //  ]),)
//                       Spacer(),
//                       Utils.customDivider(indent: 0, endent: 150),
//                       const Gap(10),
//                       Row(
//                         children: [
//                           Row(
//                             children: [
//                               Utils.mediumHeadingText(text: '${UtilStrings.items} : '),
//                               Utils.mediumHeadingText(text: '0.00'),
//                             ],
//                           ),
//                           const Gap(30),
//                           Row(
//                             children: [
//                               Utils.mediumHeadingText(text: '${UtilStrings.total} : '),
//                               Utils.mediumHeadingText(text: '0.00'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const Gap(10),
//                       Utils.customDivider(indent: 0, endent: 0),
//                       const Gap(5),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Utils.mediumHeadingText(text: 'Discount'),
//                               const Gap(3),
//                               Utils.customIcon(
//                                   icon: Icons.info, color: AppColor.sky_blue),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Utils.mediumHeadingText(text: '(-) : '),
//                               Utils.customIcon(icon: Icons.edit, size: 18),
//                               Utils.mediumHeadingText(text: '0.00'),
//                             ],
//                           ),
//                           const Gap(20),
//                         ],
//                       ),
//
//                       /// Small Button....
//                       Container(
//                         width: double.infinity,
//                         // color: AppColor.green,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 SmallCustomButtonWithIcon(
//                                   icon: Icons.edit,
//                                   label: 'Quotation',
//                                   bgcolor: Colors.orange,
//                                   isTagType: true,
//                                   isLeft: true,
//                                   textColor: AppColor.white,
//                                 ),
//                                 SmallCustomButtonWithIcon(
//                                     icon: Icons.check,
//                                     label: 'Credit Sale',
//                                     bgcolor: AppColor.light_purple,
//                                     isTagType: true,
//                                     isLeft: true,
//                                     textColor: AppColor.white),
//                                 SmallCustomButtonWithIcon(
//                                     icon: Icons.payment,
//                                     label: 'Card',
//                                     bgcolor: Colors.pinkAccent,
//                                     isTagType: true,
//                                     isLeft: true,
//                                     textColor: AppColor.white),
//                               ],
//                             ),
//                             const Gap(10),
//                             Row(
//                               children: [
//                                 SmallCustomButtonWithIcon(
//                                     icon: Icons.payment,
//                                     label: 'MultiPay',
//                                     bgcolor: Colors.black,
//                                     isTagType: true,
//                                     isLeft: true,
//                                     textColor: AppColor.white),
//                                 SmallCustomButtonWithIcon(
//                                     icon: Icons.attach_money_outlined,
//                                     label: 'Cash',
//                                     bgcolor: Colors.green,
//                                     isTagType: true,
//                                     isLeft: true,
//                                     textColor: AppColor.white),
//                                 Utils.mediumHeadingText(
//                                     text: 'Total Payable : 16.68'),
//                               ],
//                             ),
//                             const Gap(5),
//                             SmallCustomButtonWithIcon(
//                               icon: Icons.clear,
//                               label: 'Cancle',
//                               bgcolor: Colors.red,
//                               isTagType: false,
//                               isLeft: true,
//                               textColor: AppColor.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Gap(20),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
