import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_product_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/pos/pos_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/preference_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/custom_text_filed.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PosPage extends StatefulWidget {
  const PosPage({Key? key}) : super(key: key);

  @override
  _PosPageState createState() => _PosPageState();
}

class _PosPageState extends State<PosPage> {
  late final TabController tabController;
  late AnimationController animationController;
  late TextEditingController userController = TextEditingController();
  late TextEditingController productController = TextEditingController();
  late TextEditingController taxController = TextEditingController();
  late TextEditingController discountController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  late double SubTotal = 0;
  @override
  void initState() {
    print('Your page value is ${getString(PrefKeyConstants.isOpen)}');
    Provider.of<PosPageViewModel>(context, listen: false).isLoading = true;
    Provider.of<PosPageViewModel>(context, listen: false)
        .businessList()
        .then((value) {
      Provider.of<PosPageViewModel>(context, listen: false).selectId =
          Provider.of<PosPageViewModel>(context, listen: false)
              .locationList[0]
              .id;
    });

    discountController.text = '0';
    taxController.text = '0';

    Provider.of<PosPageViewModel>(context, listen: false).userList();
    Provider.of<PosPageViewModel>(context, listen: false).productList();

    super.initState();
    if(getString(PrefKeyConstants.isOpen) != 'true'){
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        await showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Cash in hand"),
            content: TextField(
              controller: cashController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Enter Cash',
                  helperText: 'Enter Cash',
                  prefixIcon: Icon(
                    Icons.attach_money_outlined,
                    color: Colors.green,
                  ),
                  suffixStyle: TextStyle(color: Colors.green)),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return HomePage();
                  }), (route) => false);
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                },
              ),
              FlatButton(
                child: const Text("Open Register"),
                onPressed: () {
                  if(cashController.text.isNotEmpty){
                    showLoadingDialog(context: context);
                    ReqPos res = ReqPos(locationId: Provider.of<PosPageViewModel>(context, listen: false).selectId, status: 'open',initialAmount: cashController.text,createdAt: DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()).toString());
                    Provider.of<PosPageViewModel>(context, listen: false).openRegister(res, context, false).then((value) {
                      if(value.isSuccess){
                        setString(PrefKeyConstants.isOpen, 'true');
                        ToastUtils.showCustomToast(context, 'Register open successfully', 'success');
                      }
                    });
                  }else{
                    ToastUtils.showCustomToast(context, UtilStrings.pleaseEnterYourCash, 'warning');
                    // ToastUtils.showCustomToast(context, getTranslated(context, UtilStrings.pleaseEnterYourCash), 'warning');
                  }
                },
              ),
            ],
          ),
        );
      });

    }
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
                    padding: const EdgeInsets.only(
                        top: 5, left: 16, right: 16, bottom: 10),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 27),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                  ),
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
                                    locationId: Provider.of<PosPageViewModel>(context, listen: false).selectId,
                                    status: 'close',
                                    closingAmount: '100',
                                  );
                                  Provider.of<PosPageViewModel>(context, listen: false).openRegister(res, context, true).then((value) {
                                    if(value.isSuccess){
                                      setString(PrefKeyConstants.isOpen, 'false');
                                      ToastUtils.showCustomToast(context, 'Register close successfully', 'success');
                                    }
                                  });
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
                              Utils.mediumHeadingText(text: 'Store - '),
                              Consumer<PosPageViewModel>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return DropdownButton<String>(
                                    value: value.selectId,
                                    items: value.locationList
                                        .map<DropdownMenuItem<String>>(
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
                                },
                              ),
                              const Spacer(),
                              Utils.mediumHeadingText(
                                  text: '20-11-2021  19:41 PM'),
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
                                border: Border.all(
                                    color: AppColor.grey, width: 1),
                                color: AppColor.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.grey2,
                                    offset: Offset(-1.0, 10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TypeAheadField(
                                  suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      elevation: 5),
                                  textFieldConfiguration:
                                  TextFieldConfiguration(
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
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.1))),
                                      child: ListTile(
                                        title: Text(
                                            '${suggestion.supplierBusinessName} -> ${suggestion.id}'),
                                      ),
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
                                border: Border.all(
                                    color: AppColor.grey, width: 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.grey2,
                                    offset: Offset(-1.0, 10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TypeAheadField(
                                  suggestionsBoxDecoration:
                                  SuggestionsBoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      elevation: 5),
                                  keepSuggestionsOnLoading: false,
                                  hideSuggestionsOnKeyboardHide: false,
                                  textFieldConfiguration:
                                  TextFieldConfiguration(
                                    autofocus: false,
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
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.grey
                                                  .withOpacity(0.1))),
                                      child: ListTile(
                                        title:
                                        Text(suggestion.name.toString()),
                                      ),
                                    );
                                  },
                                  onSuggestionSelected: (Items suggestion) {
                                    productController.text =
                                        suggestion.name.toString();
                                    productController.clear();
                                    var poproviser =
                                    Provider.of<PosPageViewModel>(context,
                                        listen: false);
                                    if (poproviser.cartItemList
                                        .contains(suggestion)) {
                                      suggestion.itemCounter++;
                                    } else {
                                      poproviser.cartItemList.add(suggestion);
                                    }
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          border: Border.all(width: 1, color: AppColor.grey2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Utils.boldSubHeadingText(
                                    text: 'Product', textSize: 12),
                                SizedBox(
                                    height: 30,
                                    child: Utils.customVerticalDivider()),
                                Utils.boldSubHeadingText(
                                    text: 'Quantity', textSize: 12),
                                SizedBox(
                                    height: 30,
                                    child: Utils.customVerticalDivider()),
                                Utils.boldSubHeadingText(
                                    text: 'Subtotal', textSize: 12),
                              ],
                            ),
                            Utils.customDivider(),
                            SizedBox(
                              height: Utils.getHeight(context) * 0.5,
                              child: Consumer<PosPageViewModel>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return ListView.builder(
                                      itemCount: value.cartItemList.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return productContainer(
                                            context: context,
                                            title: value
                                                .cartItemList[index].name,
                                            price: value
                                                .cartItemList[index]
                                                .productVariations[0]
                                                .variations[0]
                                                .defaultSellPrice,
                                            qty: value.cartItemList[index]
                                                .itemCounter,
                                            index: index,
                                            item: value.cartItemList[index]);
                                      });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(context));
  }

  Consumer<PosPageViewModel> bottomNavigationBar(BuildContext context) {
    return Consumer<PosPageViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          List<Product> items = [];
          var subTotal = 0.0;
          for (var i = 0; i < value.cartItemList.length; i++) {
            items.add(Product(
                productId: value.cartItemList[i].id,
                quantity: value.cartItemList[i].itemCounter.toString(),
                variationId:
                value.cartItemList[i].productVariations[0].id.toString(),
                unitPrice: value.cartItemList[i].productVariations[0].variations[0]
                    .defaultSellPrice));
            subTotal = subTotal +
                (value.cartItemList[i].itemCounter *
                    double.parse(value.cartItemList[i].productVariations[0]
                        .variations[0].defaultSellPrice));
          }

          var discountAmountForFix = double.parse(discountController.text);
          var discountAmountForPercantage =
              subTotal * double.parse(discountController.text) / 100;

          var discountPrice = value.selectrange == 'Fixed'
              ? discountAmountForFix
              : discountAmountForPercantage;

          var totalAmount = (value.selectrange == 'Fixed'
              ? subTotal - discountAmountForFix
              : subTotal - discountAmountForPercantage);
              // - double.parse(cashController.text);

          return Container(
            margin: const EdgeInsets.only(left: 2, right: 2),
            height: 210,
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
              border: Border.all(color: AppColor.grey2, width: 1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 15, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: commonText(
                                  title: UtilStrings.subTotal,
                                  subTitle: "$subTotal")),
                          const Gap(10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
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
                                          child: const Text('Clear'),
                                          onPressed: () {
                                            value.notifyListeners();
                                            taxController.text = '0';
                                            Navigator.pop(context);
                                          },
                                        ),
                                        FlatButton(
                                          child: const Text('Add'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: commonText(
                                  title: UtilStrings.tax,
                                  subTitle: taxController.text),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  AlertDialog(
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
                                      },);
                                  },
                                  child: commonText(
                                      title: UtilStrings.discount,
                                      subTitle: discountPrice.toString()))),
                          const Gap(10),
                          Expanded(
                            child: commonText(
                                title: UtilStrings.totalPayable, subTitle: '$totalAmount'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  commonContainer(
                                    title: 'Quot',
                                    color: const Color(0xffb0bec5),
                                    icon: Icons.description_outlined,
                                    iconColor: AppColor.white,
                                  ),
                                  const Gap(10),
                                  commonContainer(
                                    title: 'Draft',
                                    color: const Color(0xffffb74d),
                                    icon: Icons.notes_outlined,
                                    iconColor: AppColor.white,
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Sell s = Sell(
                                        contactId: 1,
                                        discountAmount: value.selectrange == 'Fixed'? discountAmountForFix.toString() :discountAmountForPercantage.toString(),
                                        discountType:  value.selectrange,
                                        locationId: int.parse(value.selectId),
                                        payments:[ Payment(amount: '$totalAmount',method: UtilStrings.card)],
                                        products: items,
                                      );
                                      ReqCreateSell se = ReqCreateSell(sells: [s]);
                                      // print('Your s is ${s.toJson()}');
                                      print('Your s is ${se.toJson()}');
                                      showLoadingDialog(context: context);
                                      Provider.of<PosPageViewModel>(context,listen: false).createSell(se,context).then((value) {
                                       // if(value.isSuccess){
                                       //   showDialog(
                                       //     context: context,
                                       //     builder: (BuildContext context) {
                                       //       return AlertDialog(
                                       //         title: Text("My title"),
                                       //         content: Text("This is my message."),
                                       //         actions: [
                                       //       TextButton(
                                       //       child: Text("Print"),
                                       //       onPressed: () async{
                                       //         if (await canLaunch('https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96')) {
                                       //           await launch('https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96');
                                       //         } else
                                       //         throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                       //       },
                                       //       )
                                       //         ],
                                       //       );
                                       //     },
                                       //   );
                                       // }
                                      });
                                    },
                                    child: commonContainer(
                                      title: UtilStrings.card,
                                      color: const Color(0xff7986cb),
                                      icon: Icons.credit_card_outlined,
                                      iconColor: AppColor.white,
                                    ),
                                  ),
                                  const Gap(10),
                                  commonContainer(
                                    title: 'Cash',
                                    color: const Color(0xff81c784),
                                    icon: Icons.monetization_on_outlined,
                                    iconColor: AppColor.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        FittedBox(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  commonContainer(
                                    title: 'Cancel',
                                    color: const Color(0xfff06292),
                                    icon: Icons.cancel,
                                    iconColor: AppColor.white,
                                  ),
                                  const Gap(10),
                                  commonContainer(
                                    title: 'Susend',
                                    color: const Color(0xff64b5f6),
                                    icon: Icons.notes_outlined,
                                    iconColor: AppColor.white,
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  commonContainer(
                                    title: 'Other',
                                    color: const Color(0xffaed581),
                                    icon: Icons.notes_outlined,
                                    iconColor: AppColor.white,
                                  ),
                                  const Gap(10),
                                  commonContainer(
                                    title: 'Credit',
                                    color: const Color(0xff9575cd),
                                    icon: Icons.check,
                                    iconColor: AppColor.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Column(
            //           children: [
            //                     commonText(title: UtilStrings.subTotal, subTitle: '6.00'),
            //                     const Gap(5),
            //                     commonText(title: UtilStrings.discount, subTitle: '6.00'),
            //           ],
            //         ),
            //         Utils.customVerticalDivider(),
            //         Column(
            //           children: [
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //             const Gap(5),
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Utils.customDivider(),
            //     Row(
            //       children: [
            //         Column(
            //           children: [
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //             const Gap(5),
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //           ],
            //         ),
            //         Utils.customVerticalDivider(),
            //         Column(
            //           children: [
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //             const Gap(5),
            //             commonText(title: UtilStrings.tax, subTitle: '6.00'),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          );
        });

    ///..................///

    //   Container(
    //   height: 220,
    //   decoration: BoxDecoration(
    //     boxShadow: const [
    //       BoxShadow(
    //         color: AppColor.grey,
    //         offset: Offset(5.0, 10),
    //         blurRadius: 15,
    //         spreadRadius: 1,
    //       ),
    //     ],
    //     color: AppColor.white,
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    //   width: Utils.getWidth(context),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //
    //         const Gap(3),
    //         Utils.customDivider(),
    //         const Gap(3),
    //         commonText(title: UtilStrings.tax, subTitle: '6.00'),
    //         const Gap(3),
    //         Utils.customDivider(),
    //         commonText(title: UtilStrings.discount, subTitle: '5.00'),
    //         const Gap(5),
    //         Utils.customDivider(),
    //         commonText(
    //             title: UtilStrings.totalPayable,
    //             subTitle: '19.99',
    //             color: AppColor.green),
    //         const Gap(5),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             commonContainer(
    //               title: 'Quotation',
    //               color: const Color(0xff90a4ae),
    //               icon: Icons.summarize_outlined,
    //               iconColor: Color(0xff263238),
    //             ),
    //             commonContainer(
    //               title: 'Card',
    //               color: const Color(0xff90caf9),
    //               icon: Icons.credit_card_outlined,
    //               iconColor: Color(0xff0d47a1),
    //             ),
    //             commonContainer(
    //               title: 'Cash',
    //               color: Color(0xffa5d6a7),
    //               icon: Icons.monetization_on_outlined,
    //               iconColor: Color(0xff1b5e20),
    //             ),
    //           ],
    //         ),
    //         const Gap(5),
    //         Row(
    //           children: [
    //             commonContainer(
    //               title: 'Credit Sale',
    //               color: Color(0xff80cbc4),
    //               icon: Icons.done_outlined,
    //               iconColor: Color(0xff004d40),
    //             ),
    //             const Gap(7),
    //             commonContainer(
    //               title: 'Multiple Pay',
    //               color: Color(0xffb39ddb),
    //               icon: Icons.payments_outlined,
    //               iconColor: Color(0xff311b92),
    //             ),
    //             const Gap(80),
    //             Utils.customIcon(
    //                 icon: Icons.cancel_outlined, size: 30, color: AppColor.red),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget productContainer({
    required BuildContext context,
    required String title,
    required int index,
    required String price,
    required int qty,
    required Items item,
  }) {
    return Container(
        margin: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColor.grey2),
        ),
        width: Utils.getWidth(context),
        child: Consumer<PosPageViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return Padding(
              padding:
              const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              value.cartItemList[index].itemCounter = 1;
                              value.cartItemList.removeAt(index);
                            });
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            size: 20,
                            color: AppColor.red,
                          ),
                        ),
                        const Gap(5),
                        FittedBox(child: Utils.mediumHeadingText(text: title)),
                      ],
                    ),
                  ),

                  /// Quantity....
                  Expanded(
                    child: Column(
                      children: [
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
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: AppColor.red,
                                        ),
                                        Utils.customVerticalDivider(),
                                      ],
                                    )),
                                Utils.smallHeadingText(text: '$qty'),
                                InkWell(
                                    onTap: () {
                                      value.addCounter(item);
                                    },
                                    child: Row(
                                      children: [
                                        Utils.customVerticalDivider(),
                                        const Icon(
                                          Icons.add,
                                          size: 20,
                                          color: AppColor.green,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  /// Sub Total.....
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                          height: 30,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.blue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Utils.boldSubHeadingText(
                              text: '${double.parse(price) * item.itemCounter}',
                              textSize: 12,
                              color: AppColor.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  Widget commonContainer(
      {required title,
        required Color? color,
        required IconData? icon,
        Color? iconColor}) {
    return Container(
      height: 30,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
            const Gap(3),
            FittedBox(
              child: Utils.mediumHeadingText(
                  text: title, textSize: 12, color: AppColor.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonText(
      {required String title, required String subTitle, Color? color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Utils.mediumHeadingText(text: title, color: color ?? AppColor.black),
        //
        const Spacer(),
        Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Utils.boldSubHeadingText(
              text: subTitle, textSize: 12, color: AppColor.blue),
        ),
      ],
    );
  }
}
class StateService {
  static Future<List<User>> getSuggestions(String query, BuildContext context) async {
    List<User> searchedUser = [];
    searchedUser.addAll(Provider.of<PosPageViewModel>(context, listen: false).usersList);
    searchedUser.retainWhere((s) {
      return s.id.toLowerCase().contains(query.toLowerCase());
    });

    return searchedUser;
  }

  static Future<List<Items>> getProductSuggestions(
      String query, BuildContext context) async {
    List<Items> products = [];
    products.addAll(Provider.of<PosPageViewModel>(context, listen: false).productsList);
    // Provider.of<PosPageViewModel>(context, listen: false).productsList;
    products.retainWhere((s) {
      return s.name.toLowerCase().contains(query.toLowerCase());
    });

    return products;
  }
}
