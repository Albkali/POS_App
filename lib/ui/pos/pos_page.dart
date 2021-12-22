import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_sell_textfiled.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';
import 'package:provider/provider.dart';

class PosPage extends StatefulWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  State<PosPage> createState() => _PosPageState();
}

class _PosPageState extends State<PosPage>   with SingleTickerProviderStateMixin {

  late final TabController tabController;
  late AnimationController animationController;
  late TextEditingController textEditingController = TextEditingController();
  final Duration _duration = const Duration(milliseconds: 500);
  final Tween<Offset> _tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
  TextEditingController cashController = TextEditingController();

  @override
  void initState() {
    tabController  = TabController(length: 2, vsync: this,);
   Provider.of<PosPageViewModel>(context,listen: false).userList();
   Provider.of<PosPageViewModel>(context,listen: false).productList();
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Cash in hand"),
          content:TextField(
            controller: cashController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)
                ),
                hintText: 'Enter Cash',
                helperText: 'Enter Cash',
                prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.green,),
                suffixStyle: TextStyle(color: Colors.green)),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text("Open Register"),
              onPressed: () {
                showLoadingDialog(context: context);
                ReqPos res = ReqPos(locationId: '9', status: 'open',initialAmount: cashController.text,createdAt: '2020-5-7 15:20:22');
                // ReqPos res = ReqPos(locationId: '9', status: 'open',initialAmount: cashController.text,createdAt: DateTime.now().toString());
                Provider.of<PosPageViewModel>(context,listen: false).openRegister(res, context, false);
              },
            ),
          ],
        ),
      );
    });
  }


  String _scanBarcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    dynamic barcodeScanResList = [
      'Mango',
      'Apple',
      'Pinepale',
      'Banana',
      'Lemon',
      'Fig',
    ];
    Future<void> scanBarcodeNormal() async {
      try {
        barcodeScanResList = (await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE));
        Provider.of<PosPageViewModel>(context,listen: false).scannedItems.add(barcodeScanResList);
        // scannedItems.add(barcodeScanResList);
        print('BARCODE RESULT ----> $barcodeScanResList');
      } on PlatformException {
        barcodeScanResList = 'Failed to get platform version.';
      }

      if (!mounted) return;
      setState(() {
        _scanBarcode = barcodeScanResList;
      });
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 205,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColor.grey,
              offset: Offset(5.0, 10),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: Utils.getWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                  title: '${UtilStrings.subTotal} (1 item)', subTitle: '18.99'),
              const Gap(3),
              commonText(title: UtilStrings.tax, subTitle: '6.00'),
              commonText(title: UtilStrings.discount, subTitle: '5.00'),
              const Gap(10),
              Utils.customDivider(),
              commonText(title: UtilStrings.totalPayable, subTitle: '19.99'),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonContainer(
                    title: 'Quotation',
                    color: const Color(0xff90a4ae),
                    icon: Icons.summarize_outlined,
                    iconColor: const Color(0xff263238),
                  ),
                  commonContainer(
                    title: 'Card',
                    color: const Color(0xff90caf9),
                    icon: Icons.credit_card_outlined,
                    iconColor: const Color(0xff0d47a1),

                  ),
                  commonContainer(
                    title: 'Cash',
                    color: const Color(0xffa5d6a7),
                    icon: Icons.monetization_on_outlined,
                    iconColor: const Color(0xff1b5e20),
                  ),
                ],
              ),
              const Gap(10),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonContainer(
                    title: 'Credit Sale',
                    color: const Color(0xff80cbc4),
                    icon: Icons.done_outlined,
                    iconColor: const Color(0xff004d40),
                  ),
                  const Gap(7),
                  commonContainer(
                    title: 'Multiple Pay',
                    color: const Color(0xffb39ddb),
                    icon: Icons.payments_outlined,
                    iconColor: const Color(0xff311b92),
                  ),
                  const Gap(80),
                  Utils.customIcon(
                      icon: Icons.cancel_outlined,
                      size: 30,
                      color: AppColor.red),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Custom AppBar....
              Container(
                height: 110,
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
                      top: 5, left: 16, right: 16, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_outlined,
                          ),
                          const Gap(10),
                          Row(
                            children: const [
                              Text(UtilStrings.smart,
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Gap(5),
                              Text('x',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const SizedBox(),
                          const Center(
                            child: Text(UtilStrings.pos,
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                          InkWell(onTap: (){
                            showLoadingDialog(context: context);
                            ReqPos res = ReqPos(locationId: '9', status: 'close',closingAmount: cashController.text,);
                            Provider.of<PosPageViewModel>(context,listen: false).openRegister(res, context, true);
                          },
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Gap(5),
                          const Icon(
                            Icons.location_on_outlined,
                          ),
                          Utils.mediumHeadingText(text: 'Store -'),
                          const Spacer(),
                          Utils.mediumHeadingText(text: '20-11-2021  19:41 PM'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),

              /// TextFiled...
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.grey2,
                                  offset: Offset(-1.0, 10),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TypeAheadField(
                                textFieldConfiguration: TextFieldConfiguration(
                                  onTap: () {
                                    // print('Checkl it,....');
                                  },
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: 14,
                                    ),
                                    contentPadding: EdgeInsets.only(top: 4),
                                    border: InputBorder.none,
                                    hintText: UtilStrings.walkInCustomer,
                                    prefixIcon: Icon(
                                      Icons.group_add_outlined,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                  controller:
                                  textEditingController,
                                ),
                                suggestionsCallback: (pattern) async {
                                  return await StateService.getSuggestions(
                                      pattern);
                                },
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.toString()),
                                  );
                                },
                                onSuggestionSelected: (suggestion) {
                                  textEditingController.text =
                                      suggestion.toString();
                                }),
                            // child: const TextField(
                            //   textAlignVertical: TextAlignVertical.center,
                            //   textAlign: TextAlign.center,
                            //   // controller: nameController,
                            //   decoration: InputDecoration(
                            //     prefixIcon: Icon(
                            //       Icons.group_add_outlined,
                            //       color: AppColor.grey,
                            //     ),
                            //     border: InputBorder.none,
                            //     // labelText: 'User Name',
                            //     hintStyle: TextStyle(
                            //       color: AppColor.grey,
                            //     ),
                            //     hintText: UtilStrings.walkInCustomer,
                            //   ),
                            // ),
                          ),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.group_add_outlined,
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.grey2,
                                  offset: Offset(-1.0, 10),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const TextField(
                              // textAlignVertical: TextAlignVertical.center,
                              // textAlign: TextAlign.center,
                              // controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.zoom_in_outlined,
                                  color: AppColor.grey,
                                ),
                                border: InputBorder.none,
                                // labelText: 'User Name',
                                hintStyle: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 14,
                                ),
                                hintText: UtilStrings.enterProductName,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),
                        ),
                        const Gap(5),
                        InkWell(
                          onTap: () {
                            scanBarcodeNormal();
                          },
                          child: const Icon(
                            Icons.qr_code_scanner_outlined,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),

                    /// Listview Builder.....
                    SizedBox(
                      height: Utils.getHeight(context) * 0.40,
                      width: Utils.getWidth(context),
                      child: Consumer<PosPageViewModel>(
                        builder: (BuildContext context, value, Widget? child) {
                          return ListView.builder(
                              itemCount: value.scannedItems.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return productContainer(
                                    context: context,
                                    title: value.scannedItems[index],
                                    index: index);
                              });
                        },)
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productContainer({
    required BuildContext context,
    required String title,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1, color: AppColor.grey2),
        ),
        height: Utils.getHeight(context) * 0.15,
        width: Utils.getWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(10),

              /// Product...
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.boldSubHeadingText(
                      text: UtilStrings.product, textSize: 13),
                  const Gap(5),
                  Utils.mediumHeadingText(text: title),
                ],
              ),
              const Gap(10),
              Utils.customVerticalDivider(),
              const Gap(10),

              /// Quantity....
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Utils.boldSubHeadingText(
                          text: UtilStrings.quantity, textSize: 13)),
                  const Gap(10),

                  /// add remove button...

                  Consumer<PosPageViewModel>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Container(
                        height: 22,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColor.grey, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    value.removeCounter();
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                              Utils.smallHeadingText(
                                  text:
                                  ' ${value.counter.toString()}'),
                              InkWell(
                                  onTap: () {
                                    print('CHECK IT...');
                                    value.addCounter();

                                    // Provider.of<PosPageViewModel>(context).addCounter();
                                  },
                                  child: const Icon(Icons.add, size: 20)),
                            ],
                          ),
                        ),
                      );
                    },),

                  const Gap(8),

                  /// filter.....
                  customDropDownFilter(context),
                ],
              ),
              const Gap(10),
              Utils.customVerticalDivider(),
              const Gap(10),

              /// Sub Total.....
              Column(
                children: [
                  Row(
                    children: [
                      Utils.boldSubHeadingText(
                          text: UtilStrings.subTotal, textSize: 13),
                      const Gap(2),
                      InkWell(
                        onTap: () {
                          setState(() {

                          });
                          Provider.of<PosPageViewModel>(context,listen: false).scannedItems.removeAt(index);
                          // scannedItems.removeAt(index);
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          size: 20,
                          color: AppColor.red,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Utils.mediumHeadingText(
                      text: '18.99 Rs.', color: AppColor.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonContainer(
      {required title, required Color? color, required IconData? icon, Color? iconColor}) {
    return Container(
      height: 30,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            const Gap(3),
            Utils.mediumHeadingText(text: title, textSize: 12),
          ],
        ),
      ),
    );
  }

  Widget commonText({required String title, required String subTitle}) {
    return Row(
      children: [
        Utils.mediumHeadingText(text: title, color: AppColor.black),
        const Spacer(),
        Utils.mediumHeadingText(text: subTitle, color: AppColor.blue),
      ],
    );
  }
  customDropDownFilter(BuildContext context) {
    final list_items = [1, 2, 3, 4, 5];
    var _value = 1;
    return Container(
      height: 22,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.grey, width: 1),
      ),
      child: DropdownButton(
        underline: Container(
          width: 0,
          height: 0,
        ),
        value: _value,
        items: list_items.map((dynamic item) {
          return DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                'Filter$item',
                style: const TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
              ),
            ),
            value: item,
            enabled: true,
          );
        }).toList(),
        onChanged: (dynamic value) {
          Provider.of<PosPageViewModel>(context).isSelectedIndex =  value;
          // controller.isSelectedIndex.value = value;
          print('VALUE ----> $value');
        },
        icon: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.expand_more_outlined,
            size: 20,
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }

}

class StateService {
  static final List<String> states = [
    'ANDAMAN AND NICOBAR ISLANDS',
    'ANDHRA PRADESH',
    'ARUNACHAL PRADESH',
    'ASSAM',
    'BIHAR',
    'CHATTISGARH',
    'CHANDIGARH',
    'DAMAN AND DIU',
    'DELHI',
    'DADRA AND NAGAR HAVELI',
    'GOA',
    'GUJARAT',
    'HIMACHAL PRADESH',
    'HARYANA',
    'JAMMU AND KASHMIR',
    'JHARKHAND',
    'KERALA',
    'KARNATAKA',
    'LAKSHADWEEP',
    'MEGHALAYA',
    'MAHARASHTRA',
    'MANIPUR',
    'MADHYA PRADESH',
    'MIZORAM',
    'NAGALAND',
    'ORISSA',
    'PUNJAB',
    'PONDICHERRY',
    'RAJASTHAN',
    'SIKKIM',
    'TAMIL NADU',
    'TRIPURA',
    'UTTARAKHAND',
    'UTTAR PRADESH',
    'WEST BENGAL',
    'TELANGANA',
    'LADAKH'
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(states);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

}
