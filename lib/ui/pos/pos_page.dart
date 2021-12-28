import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_product_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/preference_utils.dart';
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

class _PosPageState extends State<PosPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late AnimationController animationController;
  late TextEditingController userController = TextEditingController();
  late TextEditingController productController = TextEditingController();
  late TextEditingController taxController = TextEditingController();
  late TextEditingController discountController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  late double SubTotal = 0;

  // final Duration _duration = const Duration(milliseconds: 500);
  final Tween<Offset> _tween =
      Tween(begin: const Offset(0, 1), end: const Offset(0, 0));

  @override
  void initState() {
    Provider.of<PosPageViewModel>(context, listen: false).businessList().then((value) {
      Provider.of<PosPageViewModel>(context, listen: false).selectId =   Provider.of<PosPageViewModel>(context, listen: false).locationList[0].id;
    });

    discountController.text = '0';
    taxController.text = '0';
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    Provider.of<PosPageViewModel>(context, listen: false).userList();
    Provider.of<PosPageViewModel>(context, listen: false).productList();

    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //   await showDialog<String>(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: (BuildContext context) => AlertDialog(
    //       title: const Text("Cash in hand"),
    //       content: TextField(
    //         controller: cashController,
    //         decoration: const InputDecoration(
    //             border: OutlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.teal)),
    //             hintText: 'Enter Cash',
    //             helperText: 'Enter Cash',
    //             prefixIcon: Icon(
    //               Icons.attach_money_outlined,
    //               color: Colors.green,
    //             ),
    //             suffixStyle: TextStyle(color: Colors.green)),
    //       ),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: const Text("Open Register"),
    //           onPressed: () {
    //             showLoadingDialog(context: context);
    //             ReqPos res = ReqPos(
    //                 locationId: '9',
    //                 status: 'open',
    //                 initialAmount: cashController.text,
    //                 createdAt: '2020-5-7 15:20:22');
    //             // ReqPos res = ReqPos(locationId: '9', status: 'open',initialAmount: cashController.text,createdAt: DateTime.now().toString());
    //             print('Hello friends $res');
    //             Provider.of<PosPageViewModel>(context, listen: false)
    //                 .openRegister(res, context, false);
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // });
  }

  String _scanBarcode = '';

  @override
  Widget build(BuildContext context) {
    dynamic barcodeScanResList;

    Future<void> scanBarcodeNormal() async {
      var posprovider = Provider.of<PosPageViewModel>(context, listen: false);
      try {
        barcodeScanResList = (await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE));
        print("barcode list ${barcodeScanResList.runtimeType} ");
        if (barcodeScanResList == '-1') {
          print("in if part");
        } else {
          for (int i = 0; i < posprovider.productsList.length; i++) {
            if (posprovider.productsList[i].sku == barcodeScanResList) {
              if (posprovider.cartItemList
                  .contains(posprovider.productsList[i])) {
                print("remaining part");
                posprovider.productsList[i].itemCounter++;
              } else {
                print("hello else part");
                posprovider.cartItemList.add(posprovider.productsList[i]);
              }
            }
          }
        }
      } on PlatformException {
        barcodeScanResList = 'Failed to get platform version.';
      }
      if (!mounted) return;
      setState(() {
        _scanBarcode = barcodeScanResList;
      });
    }

    return Scaffold(
      bottomNavigationBar: Consumer<PosPageViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          List<Product> items = [];
          var subTotal =  0.0;
          for(var i =0; i < value.cartItemList.length; i++){
            items.add(Product(productId: value.cartItemList[i].id, quantity: value.cartItemList[i].itemCounter.toString(), variationId: value.cartItemList[i].productVariations[0].id.toString(), unitPrice: value.cartItemList[i].productVariations[0].variations[0].defaultSellPrice));
            subTotal =  subTotal + ( value.cartItemList[i].itemCounter  * double.parse(value.cartItemList[i].productVariations[0].variations[0].defaultSellPrice));
          }

          var discountPrice = value.selectrange == 'Fixed'?double.parse(discountController.text) : subTotal  * double.parse(discountController.text)/100 ;

          var totalAmount = value.selectrange == 'Fixed' ?subTotal - double.parse(discountController.text) :subTotal -(subTotal  * double.parse(discountController.text)/100 );
          print('Your discount is ${totalAmount}');
          print('Your discount is ${totalAmount.runtimeType}');
          return Container(
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
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(title: UtilStrings.subTotal + ' (${value.cartItemList.length} Item)', subTitle: '$subTotal'),
                    const Gap(5),
                    InkWell(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                            return   AlertDialog(
                              title:  Column(
                                children: [
                                  const Text("Add Tax"),
                                  const Gap(20),
                                  ContainerBorder(
                                    child: CustomTextFiled(
                                      textEditingController: taxController,
                                      title: '0.00',
                                      isContentPedding: true,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                FlatButton(
                                  child: const Text('Add'),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },);
                        },
                        child: commonText(title: UtilStrings.tax, subTitle: taxController.text)),
                    const Gap(5),
                    InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return   AlertDialog(
                                title:  Column(
                                  children: [
                                    const Text("Add Discount"),
                                    const Gap(20),
                                    Utils.boldSubHeadingText(
                                        text: UtilStrings.discountType, textSize: 14),
                                    Consumer<PosPageViewModel>(
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
                                    const Gap(20),
                                    ContainerBorder(
                                      child: CustomTextFiled(
                                        textEditingController: discountController,
                                        title: '0.00',
                                        isContentPedding: true,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  FlatButton(
                                    child: const Text('Add'),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },);                      },
                        child: commonText(title: UtilStrings.discount, subTitle: discountPrice.toString())),
                    const Gap(5),
                    Utils.customDivider(),
                    commonText(title: UtilStrings.totalPayable, subTitle: '${subTotal}'),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // commonContainer(
                        //   title: UtilStrings.quotation,
                        //   color: const Color(0xff90a4ae),
                        //   icon: Icons.summarize_outlined,
                        //   iconColor: const Color(0xff263238),
                        // ),


                        InkWell(
                          onTap: (){
                            Sell s = Sell(
                              contactId: 1,
                              discountAmount: 1,
                              discountType: 'Fixed',
                              locationId: 1,
                              payments:[ Payment(amount: '100',method: 'cash')],
                              products: items,
                            );
                            ReqCreateSell se = ReqCreateSell(sells: [s]);
                            showLoadingDialog(context: context);
                            Provider.of<PosPageViewModel>(context,listen: false).createSell(se,context);
                          },
                          child: commonContainer(
                            title: UtilStrings.cash,
                            color: const Color(0xffa5d6a7),
                            icon: Icons.monetization_on_outlined,
                            iconColor: const Color(0xff1b5e20),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Sell s = Sell(
                              contactId: 1,
                              discountAmount: 1,
                              discountType: 'Fixed',
                              locationId: 1,
                              payments:[ Payment(amount: '100',method: 'card')],
                              products: items,
                            );
                            ReqCreateSell se = ReqCreateSell(sells: [s]);
                            showLoadingDialog(context: context);
                            Provider.of<PosPageViewModel>(context,listen: false).createSell(se,context);
                          },
                          child: commonContainer(
                            title: UtilStrings.card,
                            color: const Color(0xff90caf9),
                            icon: Icons.credit_card_outlined,
                            iconColor: const Color(0xff0d47a1),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Sell s = Sell(
                              contactId: 1,
                              discountAmount: 1,
                              discountType: 'Fixed',
                              locationId: 1,
                              payments:[ Payment(amount: '100',method: 'other')],
                              products: items,
                            );
                            ReqCreateSell se = ReqCreateSell(sells: [s]);
                            showLoadingDialog(context: context);
                            Provider.of<PosPageViewModel>(context,listen: false).createSell(se,context);
                          },
                          child: commonContainer(
                            title: 'Other',
                            color: const Color(0xff90caf9),
                            icon: Icons.credit_card_outlined,
                            iconColor: const Color(0xff0d47a1),
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // commonContainer(
                        //   title: UtilStrings.creditSale,
                        //   color: const Color(0xff80cbc4),
                        //   icon: Icons.done_outlined,
                        //   iconColor: const Color(0xff004d40),
                        // ),
                        // const Gap(7),
                        // commonContainer(
                        //   title: UtilStrings.multiplePay,
                        //   color: const Color(0xffb39ddb),
                        //   icon: Icons.payments_outlined,
                        //   iconColor: const Color(0xff311b92),
                        // ),
                        // const Gap(80),
                        Spacer(),
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
          );
        },),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Custom AppBar....
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  color: AppColor.sky_grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                width: Utils.getHeight(context),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 16, right: 16, bottom: 10),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top :27),
                          child: Row(
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
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            const Center(
                              child: Text(UtilStrings.pos,
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                            InkWell(
                              onTap: () {
                                showLoadingDialog(context: context);
                                ReqPos res = ReqPos(
                                  locationId: '9',
                                  status: 'close',
                                  closingAmount: cashController.text,
                                );
                                Provider.of<PosPageViewModel>(context,
                                        listen: false)
                                    .openRegister(res, context, true);
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
                            Consumer<PosPageViewModel>(
                              builder: (BuildContext context, value, Widget? child) {
                                return DropdownButton<String>(
                                  value: value.selectId,
                                  items: value.locationList.map<DropdownMenuItem<String>>(
                                          (Location value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id,
                                          child: Text(
                                            value.id,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged: (String? val) async {
                                    value.selectId = val ?? '';
                                    value.notifyListeners();
                                  },
                                );
                              },),

                            const Spacer(),
                            Utils.mediumHeadingText(text: '20-11-2021  19:41 PM'),
                          ],
                        ),
                      ],
                    ),
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
                                    // print('this is textfields print....');
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
                                  controller: userController,
                                ),
                                suggestionsCallback: (pattern) async {
                                  return StateService.getSuggestions(
                                      pattern, context);
                                },
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                itemBuilder: (context, User suggestion) {
                                  return ListTile(
                                    title: Text('${suggestion.supplierBusinessName} -> ${suggestion.id}'),
                                  );
                                },
                                onSuggestionSelected: (User suggestion) {
                                  userController.text =
                                      suggestion.id.toString();
                                }),
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
                                    hintText: UtilStrings.enterProductName,
                                    prefixIcon: Icon(
                                      Icons.zoom_in_outlined,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                  controller: productController,
                                ),
                                suggestionsCallback: (pattern) async {
                                  return StateService.getProductSuggestions(
                                      pattern, context);
                                },
                                transitionBuilder:
                                    (context, suggestionsBox, controller) {
                                  return suggestionsBox;
                                },
                                itemBuilder: (context, Items suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.name.toString()),
                                  );
                                },
                                onSuggestionSelected: (Items suggestion) {
                                  productController.clear();
                                  var poproviser =
                                      Provider.of<PosPageViewModel>(context,
                                          listen: false);
                                  if (poproviser.cartItemList
                                      .contains(suggestion)) {
                                    // print("remaining part");
                                    // print("old value ${suggestion.itemCounter + 1}");
                                    suggestion.itemCounter++;
                                    // print("new value ${suggestion.itemCounter++}");
                                  } else {
                                    poproviser.cartItemList.add(suggestion);
                                  }

                                  // productController.clear();
                                  // Provider.of<PosPageViewModel>(context,
                                  //         listen: false)
                                  //     .cartItemList
                                  //     .add(suggestion);
                                }),
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
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return ListView.builder(
                                itemCount: value.cartItemList.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return productContainer(
                                      context: context,
                                      title: value.cartItemList[index].name,
                                      price: value
                                          .cartItemList[index]
                                          .productVariations[0]
                                          .variations[0]
                                          .defaultSellPrice,
                                      qty:
                                          value.cartItemList[index].itemCounter,
                                      index: index,
                                      item: value.cartItemList[index]);
                                });
                          },
                        )),
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
    required String price,
    required int qty,
    required Items item,
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
          child: Consumer<PosPageViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              return Row(
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
                      Container(
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
                                    value.removeCounter(item);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                              Utils.smallHeadingText(text: '$qty'),
                              InkWell(
                                  onTap: () {
                                    value.addCounter(item);
                                  },
                                  child: const Icon(Icons.add, size: 20)),
                            ],
                          ),
                        ),
                      ),
                      const Gap(8),

                      /// filter.....
                      customDropDownFilter(context,item),
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
                              value.cartItemList
                                  .removeAt(index);
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
                      Utils.mediumHeadingText(text: '${double.parse(price) * item.itemCounter}', color: AppColor.blue),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget commonContainer(
      {required title,
      required Color? color,
      required IconData? icon,
      Color? iconColor}) {
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

  customDropDownFilter(BuildContext context,Items item) {
    final list_items = [item.unit.actualName];
    var _value = item.unit.actualName;
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
                '$item',
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
          Provider.of<PosPageViewModel>(context).isSelectedIndex = value;
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
  static Future<List<User>> getSuggestions(
      String query, BuildContext context) async {
    List<User> searchedUser =
        Provider.of<PosPageViewModel>(context, listen: false).usersList;
    searchedUser.retainWhere((s) {
      return s.id.toLowerCase().contains(query.toLowerCase());
    });

    return searchedUser;
  }

  static Future<List<Items>> getProductSuggestions(
      String query, BuildContext context) async {
    List<Items> searchedUser =
        Provider.of<PosPageViewModel>(context, listen: false).productsList;
    searchedUser.retainWhere((s) {
      return s.name.toLowerCase().contains(query.toLowerCase());
    });

    return searchedUser;
  }
}
