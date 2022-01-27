import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pos/data/models/pos/req_pos.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_product_pos.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/data/models/sell/create_sell/req_create_sell.dart';
import 'package:pos/data/models/tax/res_list_of_tax.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/app_constants.dart';
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
  final player = AudioPlayer();

  bool isSubtotalEditable = false;
  bool isQuantityEditable = false;

  String? userId;
  late final TabController tabController;
  late AnimationController animationController;
  late TextEditingController userController = TextEditingController();
  late TextEditingController productController = TextEditingController();
  late TextEditingController locationController = TextEditingController();
  late TextEditingController taxController = TextEditingController();
  late TextEditingController discountController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  TextEditingController totalPayableController = TextEditingController();

  // TextEditingController taxController = TextEditingController();
  late double subTotal = 0;
  double balance = 0;
  var tax = 0.0;
  var taxAmount = 0.0;

  String taxId = '0';

  FocusNode focus = FocusNode();
  FocusNode subTotalFocus = FocusNode();
  FocusNode quantityFocus = FocusNode();

  @override
  void initState() {
    Provider.of<PosPageViewModel>(context, listen: false).isLoading = true;
    Provider.of<PosPageViewModel>(context, listen: false)
        .businessList()
        .then((value) {
      Provider.of<PosPageViewModel>(context, listen: false).selectId =
          Provider.of<PosPageViewModel>(context, listen: false)
                  .locationList[0]
                  .id ??
              '';
    });

    discountController.text = '0';
    Provider.of<PosPageViewModel>(context, listen: false).userList();
    Provider.of<PosPageViewModel>(context, listen: false)
        .productList(context: context);
    fetchData();

    super.initState();
  }

  fetchData() async {
    if (AppConstant.status == 'open') {
    } else {
      if (getString(PrefKeyConstants.isOpen) != 'true') {
        WidgetsBinding.instance!.addPostFrameCallback((_) async {
          await showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Cash in hand"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey, width: 1),
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
                    child: TextField(
                      controller: cashController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Enter Cash',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.attach_money_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey, width: 1),
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
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5),
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              color: AppColor.grey,
                              fontSize: 14,
                            ),
                            contentPadding: EdgeInsets.only(top: 4),
                            border: InputBorder.none,
                            hintText: "Select location ",
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: AppColor.grey,
                            ),
                          ),
                          controller: locationController,
                        ),
                        suggestionsCallback: (pattern) async {
                          return StateService.getLocationSuggestions(
                              pattern, context);
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        itemBuilder: (context, Location suggestion) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1))),
                            child: ListTile(
                              title: Text(
                                  '${suggestion.locationId} (${suggestion.name})'),
                            ),
                          );
                        },
                        onSuggestionSelected: (Location suggestion) {
                          locationController.text = suggestion.name.toString();
                          setString(
                              PrefKeyConstants.locationId, suggestion.id ?? '');
                          setString(PrefKeyConstants.locationName,
                              suggestion.name ?? '');
                        }),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    // setString(PrefKeyConstants.isOpen, 'true');
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const HomePage();
                    }), (route) => false);
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: const Text("Open Register"),
                  onPressed: () {
                    if (cashController.text.isNotEmpty) {
                      showLoadingDialog(context: context);
                      ReqPos res = ReqPos(
                          locationId: getString(PrefKeyConstants.locationId),
                          status: 'open',
                          initialAmount: cashController.text,
                          createdAt: DateFormat("yyyy-MM-dd hh:mm:ss")
                              .format(DateTime.now())
                              .toString());
                      Provider.of<PosPageViewModel>(context, listen: false)
                          .openRegister(res, context, false)
                          .then((value) {
                        if (value.isSuccess) {
                          // setString(PrefKeyConstants.isOpen, 'true');
                          ToastUtils.showCustomToast(
                              context, 'Register open successfully', 'success');
                        }
                      });
                    } else {
                      ToastUtils.showCustomToast(
                          context, UtilStrings.pleaseEnterYourCash, 'warning');
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
  }

  String _scanBarcode = '';

  @override
  Widget build(BuildContext context) {
    dynamic barcodeScanResList;
    Future<void> scanBarcodeNormal() async {
      var posprovider = Provider.of<PosPageViewModel>(context, listen: false);
      // try {
      if (getBool(PrefKeyConstants.scanType) == false) {
        try {
          barcodeScanResList = (await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'close', true, ScanMode.BARCODE));
          if (barcodeScanResList == '-1') {
          } else {
            for (int i = 0; i < posprovider.productsList.length; i++) {
              if (posprovider.productsList[i].sku == barcodeScanResList) {
                if (posprovider.cartItemList
                    .contains(posprovider.productsList[i])) {
                  posprovider.productsList[i].itemCounter++;
                  await player.setAsset(UtilStrings.soundPath);
                  player.play();
                } else {
                  if (posprovider.productsList[i].enableStock == '0') {
                    ToastUtils.showCustomToast(
                        context, "PRODUCT NOT AVAILABLE", "warning");
                  } else {
                    await player.setAsset(UtilStrings.soundPath);
                    player.play();
                    posprovider.cartItemList.add(posprovider.productsList[i]);
                  }
                }
              }
            }
          }
        } on PlatformException {
          barcodeScanResList = 'Failed to get platform version.';
        }
        if (!mounted) return;
        setState(() {
          // _scanBarcode = barcodeScanResList;
        });
      } else {
        FocusScope.of(context).requestFocus(FocusNode());
        try {
          (FlutterBarcodeScanner.getBarcodeStreamReceiver(
                  '#ff6666', 'close', true, ScanMode.BARCODE))!
              .listen((barcodeScanResLists) async {
            if (barcodeScanResLists == '-1') {
            } else {
              setState(() {});
              for (int i = 0; i < posprovider.productsList.length; i++) {
                if (posprovider.productsList[i].sku == barcodeScanResLists) {
                  if (posprovider.cartItemList
                      .contains(posprovider.productsList[i])) {
                    await player.setAsset(UtilStrings.soundPath);
                    player.play();
                    posprovider.productsList[i].itemCounter++;
                  } else {
                    if (posprovider.productsList[i].enableStock == '0') {
                      ToastUtils.showCustomToast(
                          context, "PRODUCT NOT AVAILABLE", "warning");
                    } else {
                      await player.setAsset(UtilStrings.soundPath);
                      player.play();
                      posprovider.cartItemList.add(posprovider.productsList[i]);
                    }
                  }
                }
              }
            }
          });
        } on PlatformException {
          // barcodeScanResLists = 'Failed to get platform version.';
        }
        if (!mounted) return;
        setState(() {
          _scanBarcode = 'Failed to get platform version';
        });

        // await FlutterBarcodeScanner.getBarcodeStreamReceiver(
        //      '#ff6666', 'close', true, ScanMode.DEFAULT)?.listen((event) {
        //    if (event == '-1') {
        //      print("in if part");
        //    } else {
        //      for (int i = 0; i < posprovider.productsList.length; i++) {
        //        if (posprovider.productsList[i].sku == event) {
        //          if (posprovider.cartItemList
        //              .contains(posprovider.productsList[i])) {
        //            print("remaining part");
        //            posprovider.productsList[i].itemCounter++;
        //
        //          } else {
        //            print("hello else part");
        //            if (posprovider.productsList[i].enableStock == '0') {
        //              ToastUtils.showCustomToast(
        //                  context, "PRODUCT NOT AVAILABLE", "warning");
        //
        //
        //            } else {
        //              posprovider.cartItemList.add(posprovider.productsList[i]);
        //
        //            }
        //          }
        //        }
        //      }
        //    }
        //  });
      }
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
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_outlined,
                                  ),
                                ),
                                const Gap(10),
                                Row(
                                  children: const [
                                    Text(UtilStrings.divllo,
                                        style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 20,
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
                                  var path = Provider.of<PosPageViewModel>(
                                      context,
                                      listen: false);
                                  showLoadingDialog(context: context);
                                  Provider.of<PosPageViewModel>(context,
                                          listen: false)
                                      .beforeClose(
                                          getString(
                                              PrefKeyConstants.customerID),
                                          getString(
                                              PrefKeyConstants.locationId),
                                          context)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Utils.mediumHeadingText(
                                                  text:
                                                      "Current Register (${path.userData!.data.currentRegister})"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Divider(),
                                                  commonText(
                                                      title: "Total",
                                                      subTitle: path.userData!
                                                          .data.closingAmount),
                                                  const Gap(5),
                                                  commonText(
                                                      title: "Total Card Slips",
                                                      subTitle: path.userData!
                                                          .data.totalCardSlips),
                                                  const Gap(5),
                                                  commonText(
                                                      title: "Total Cheques",
                                                      subTitle: path.userData!
                                                          .data.totalCheques),
                                                ],
                                              ),
                                              actions: [
                                                FlatButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                FlatButton(
                                                  child: const Text(
                                                      'Close Register'),
                                                  onPressed: () {
                                                    showLoadingDialog(
                                                        context: context);
                                                    ReqPos res = ReqPos(
                                                      locationId: getString(
                                                          PrefKeyConstants
                                                              .locationId),
                                                      status: 'close',
                                                      closedAt: DateFormat(
                                                              "yyyy-MM-dd hh:mm:ss")
                                                          .format(
                                                              DateTime.now())
                                                          .toString(),
                                                      cashRegisterId: getString(
                                                          PrefKeyConstants
                                                              .customerID),
                                                      closingAmount: path
                                                          .userData!
                                                          .data
                                                          .closingAmount,
                                                      totalCardSlips: path
                                                          .userData!
                                                          .data
                                                          .totalCardSlips,
                                                      totalCheques: path
                                                          .userData!
                                                          .data
                                                          .totalCheques,
                                                      closingNote: 'doloram',
                                                      transactionIds: '1',
                                                    );
                                                    Provider.of<PosPageViewModel>(
                                                            context,
                                                            listen: false)
                                                        .openRegister(
                                                            res, context, true)
                                                        .then((value) {
                                                      if (value.isSuccess) {
                                                        Provider.of<PosPageViewModel>(
                                                                context,
                                                                listen: false)
                                                            .cartItemList
                                                            .clear();
                                                        setString(
                                                            PrefKeyConstants
                                                                .isOpen,
                                                            'false');
                                                        Navigator.pop(context);
                                                        ToastUtils.showCustomToast(
                                                            context,
                                                            'Register close successfully',
                                                            'success');
                                                      }
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          });
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
                              Utils.mediumHeadingText(
                                  text:
                                      getString(PrefKeyConstants.locationName)),
                              // Consumer<PosPageViewModel>(
                              //   builder: (BuildContext context, value,
                              //       Widget? child) {
                              //     return DropdownButton<String>(
                              //       borderRadius: BorderRadius.circular(10),
                              //       dropdownColor: AppColor.light_grey2,
                              //       focusColor: AppColor.white,
                              //       elevation: 10,
                              //       value: value.selectId,
                              //       items: value.locationList
                              //           .map<DropdownMenuItem<String>>(
                              //               (Location value) {
                              //             return DropdownMenuItem<String>(
                              //               value: value.id,
                              //               child: Center(
                              //                 child: Text(
                              //                   value.id,
                              //                   style: const TextStyle(
                              //                       fontSize: 12,
                              //                       fontWeight: FontWeight.w400),
                              //                 ),
                              //               ),
                              //             );
                              //           }).toList(),
                              //       onChanged: (String? val) async {
                              //         value.selectId = val ?? '';
                              //         value.notifyListeners();
                              //       },
                              //     );
                              //   },
                              // ),
                              const Spacer(),
                              Utils.mediumHeadingText(
                                  text: DateFormat("dd-MM-yyyy hh:mm a")
                                      .format(DateTime.now())
                                      .toString()),
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
                                border:
                                    Border.all(color: AppColor.grey, width: 1),
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
                                            '${suggestion.name} -> ${suggestion.id}'),
                                      ),
                                    );
                                  },
                                  onSuggestionSelected: (User suggestion) {
                                    userId = suggestion.id.toString();
                                    userController.text =
                                        suggestion.name.toString();
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
                                border:
                                    Border.all(color: AppColor.grey, width: 1),
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
                                          autofocus: true,
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                              color: AppColor.grey,
                                              fontSize: 14,
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(top: 4),
                                            border: InputBorder.none,
                                            hintText:
                                                UtilStrings.enterProductName,
                                            prefixIcon: Icon(
                                              Icons.zoom_in_outlined,
                                              color: AppColor.grey,
                                            ),
                                          ),
                                          controller: productController,
                                          focusNode: focus,
                                          onChanged: (val) async {
                                            final posprovider =
                                                Provider.of<PosPageViewModel>(
                                                    context,
                                                    listen: false);
                                            if (posprovider.skuList
                                                .contains(val)) {
                                              for (int i = 0;
                                                  i <
                                                      posprovider
                                                          .productsList.length;
                                                  i++) {
                                                if (posprovider
                                                        .productsList[i].sku ==
                                                    val) {
                                                  productController.clear();
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  if (posprovider.cartItemList
                                                      .contains(posprovider
                                                          .productsList[i])) {
                                                    await player.setAsset(
                                                        UtilStrings.soundPath);
                                                    player.play();
                                                    posprovider.productsList[i]
                                                        .itemCounter++;
                                                    HapticFeedback
                                                        .heavyImpact();
                                                  } else {
                                                    if (posprovider
                                                            .productsList[i]
                                                            .enableStock ==
                                                        '0') {
                                                      ToastUtils.showCustomToast(
                                                          context,
                                                          "PRODUCT NOT AVAILABLE",
                                                          "warning");
                                                      HapticFeedback
                                                          .heavyImpact();
                                                    } else {
                                                      await player.setAsset(
                                                          UtilStrings
                                                              .soundPath);
                                                      player.play();
                                                      posprovider.cartItemList
                                                          .add(posprovider
                                                              .productsList[i]);
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                            FocusScope.of(context)
                                                .requestFocus(focus);

                                            setState(() {});
                                          }),
                                  suggestionsCallback: (pattern) async {
                                    FocusScope.of(context).requestFocus(focus);
                                    return StateService.getProductSuggestions(
                                        pattern, context);
                                  },
                                  transitionBuilder:
                                      (context, suggestionsBox, controller) {
                                    return suggestionsBox;
                                  },
                                  itemBuilder: (context, Items suggestion) {
                                    if (productController.text.length >= 1) {
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
                                    } else {
                                      return Container();
                                    }
                                  },
                                  onSuggestionSelected:
                                      (Items suggestion) async {
                                        productController.text =
                                        suggestion.name.toString();

                                    productController.clear();
                                    var poproviser =
                                        Provider.of<PosPageViewModel>(context,
                                            listen: false);
                                    if (suggestion.enableStock == '0') {
                                      ToastUtils.showCustomToast(context,
                                          "PRODUCT NOT AVAILABLE", "warning");
                                    } else if (poproviser.cartItemList
                                        .contains(suggestion)) {
                                      await player
                                          .setAsset(UtilStrings.soundPath);
                                      player.play();
                                      suggestion.itemCounter++;
                                    } else {
                                      poproviser.cartItemList.add(suggestion);
                                      await player
                                          .setAsset(UtilStrings.soundPath);
                                      player.play();
                                    }
                                    FocusScope.of(context).requestFocus(focus);
                                    setState(() {});
                                  }),
                            ),
                          ),
                          const Gap(5),
                          InkWell(
                            onTap: () async {
                              focus.requestFocus();
                              // showLoadingDialog(context: context);
                              // await Provider.of<PosPageViewModel>(context, listen: false).productList(context: context);
                              scanBarcodeNormal();
                              // Future.delayed(const Duration(microseconds: 500),(){
                              //   return scanBarcodeNormal().whenComplete(() {
                              //     setState(() {
                              //       print("INSIDE");
                              //     });
                              //   });
                              // });
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          title: value.cartItemList[index].name,
                                          price: value
                                              .cartItemList[index]
                                              .productVariations[0]
                                              .variations[0]
                                              .defaultSellPrice,
                                          qty: value
                                              .cartItemList[index].itemCounter,
                                          index: index,
                                          item: value.cartItemList[index],
                                        );
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
      var totalTax = 0.0;
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
                    .variations[0].defaultSellPrice)
            // subTotal = subTotal + (value.cartItemList[i].itemCounter * double.parse(value.cartItemList[i].productVariations[0].variations[0].defaultSellPrice)
            );
        totalTax = subTotal * taxAmount / 100;
      }

      var discountAmountForFix = double.parse(discountController.text);
      var discountAmountForPercantage =
          subTotal * double.parse(discountController.text) / 100;

      var discountPrice = value.selectrange == 'Fixed'
          ? discountAmountForFix
          : discountAmountForPercantage;
      var totalAmount = (value.selectrange == 'Fixed'
          ? subTotal - discountAmountForFix + tax
          : subTotal - discountAmountForPercantage + tax);
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
                          onTap: () async {
                            showLoadingDialog(context: context);
                            await Provider.of<PosPageViewModel>(context,
                                    listen: false)
                                .taxList(context: context);
                            Taxes data = Taxes(name: 'None');
                            Provider.of<PosPageViewModel>(context,
                                    listen: false)
                                .taxesList
                                .insert(0, data);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return AlertDialog(
                                        content: Container(
                                      height: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Edit Order Tax"),
                                          const Gap(20),
                                          Utils.customDivider(),
                                          const Gap(20),
                                          Utils.boldSubHeadingText(
                                              text: UtilStrings.orderTax,
                                              textSize: 14),
                                          const Gap(10),
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.grey,
                                                  width: 1),
                                              color: AppColor.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: AppColor.grey2,
                                                  offset: Offset(-1.0, 10),
                                                  blurRadius: 15,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: TypeAheadField(
                                                suggestionsBoxDecoration:
                                                    SuggestionsBoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        elevation: 5),
                                                textFieldConfiguration:
                                                    TextFieldConfiguration(
                                                  decoration:
                                                      const InputDecoration(
                                                    hintStyle: TextStyle(
                                                      color: AppColor.grey,
                                                      fontSize: 14,
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.only(top: 4),
                                                    border: InputBorder.none,
                                                    hintText: "Please Select ",
                                                    prefixIcon: Icon(
                                                      Icons.info,
                                                      color: AppColor.grey,
                                                    ),
                                                  ),
                                                  controller: taxController,
                                                ),
                                                suggestionsCallback:
                                                    (pattern) async {
                                                  return StateService
                                                      .getTaxSuggestions(
                                                          pattern, context);
                                                },
                                                transitionBuilder: (context,
                                                    suggestionsBox,
                                                    controller) {
                                                  return suggestionsBox;
                                                },
                                                itemBuilder: (context,
                                                    Taxes suggestion) {
                                                  return Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.1))),
                                                      child: ListTile(
                                                          title: Text(
                                                              suggestion.name ??
                                                                  '')));
                                                },
                                                onSuggestionSelected:
                                                    (Taxes suggestion) {
                                                      taxController.text =
                                                      suggestion.name
                                                          .toString();
                                                  taxAmount = double.parse(
                                                      suggestion.amount
                                                          .toString());
                                                  taxId =
                                                      suggestion.id.toString();
                                                  setState(() {});
                                                }),
                                          ),
                                          const Gap(20),
                                          Center(
                                            child: FlatButton(
                                              child: const Text('Add'),
                                              onPressed: () {
                                                tax =
                                                    subTotal * taxAmount / 100;
                                                print("HELLO $tax");
                                                print(
                                                    "HELLO TAX AMOUNT $taxAmount");
                                                print(
                                                    "HELLO sub TOATAl $subTotal");
                                                taxController.clear();
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                                  });
                                });
                            setState(() {});

                            // showLoadingDialog(context: context);
                            // await Provider.of<PosPageViewModel>(context,listen: false).taxList(context: context);
                            // Taxes data = Taxes(name:'None');
                            // Provider.of<PosPageViewModel>(context, listen: false).taxesList.insert(0, data);
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       content: StatefulBuilder(builder: ,),
                            //       title: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           const Text("Edit Order Tax"),
                            //           const Gap(20),
                            //           Utils.customDivider(),
                            //           const Gap(20),
                            //           Utils.boldSubHeadingText(
                            //               text: UtilStrings.orderTax,
                            //               textSize: 14),
                            //           const Gap(10),
                            //           Container(
                            //             height: 40,
                            //             decoration: BoxDecoration(
                            //               border: Border.all(color: AppColor.grey, width: 1),
                            //               color: AppColor.white,
                            //               boxShadow: const [
                            //                 BoxShadow(
                            //                   color: AppColor.grey2,
                            //                   offset: Offset(-1.0, 10),
                            //                   blurRadius: 15,
                            //                   spreadRadius: 1,
                            //                 ),
                            //               ],
                            //               borderRadius: BorderRadius.circular(12),
                            //             ),
                            //             child: TypeAheadField(
                            //                 suggestionsBoxDecoration: SuggestionsBoxDecoration(
                            //                     borderRadius: BorderRadius.circular(20),
                            //                     elevation: 5),
                            //                 textFieldConfiguration: TextFieldConfiguration(
                            //                   decoration: const InputDecoration(
                            //                     hintStyle: TextStyle(
                            //                       color: AppColor.grey,
                            //                       fontSize: 14,
                            //                     ),
                            //                     contentPadding: EdgeInsets.only(top: 4),
                            //                     border: InputBorder.none,
                            //                     hintText: "Please Select ",
                            //                     prefixIcon: Icon(
                            //                       Icons.info,
                            //                       color: AppColor.grey,
                            //                     ),
                            //                   ),
                            //                   controller: taxController,
                            //                 ),
                            //                 suggestionsCallback: (pattern) async {
                            //                   return StateService.getTaxSuggestions(
                            //                       pattern, context);
                            //                 },
                            //                 transitionBuilder:
                            //                     (context, suggestionsBox, controller) {
                            //                   return suggestionsBox;
                            //                 },
                            //                 itemBuilder: (context, Taxes suggestion) {
                            //                   return Container(
                            //                     decoration: BoxDecoration(
                            //                         borderRadius: BorderRadius.circular(15),
                            //                         border: Border.all(
                            //                             color: Colors.grey.withOpacity(0.1))),
                            //                     child: ListTile(
                            //                       title: Text(suggestion.name ?? '')));
                            //                 },
                            //                 onSuggestionSelected: (Taxes suggestion) {
                            //                   taxController.text = suggestion.name.toString();
                            //                  taxAmount =  double.parse(suggestion.amount.toString());
                            //                 }),
                            //           ),
                            //         ],
                            //       ),
                            //       actions: [
                            //         FlatButton(
                            //           child: const Text('Add'),
                            //           onPressed: () {
                            //             tax = subTotal * taxAmount / 100;
                            //             taxController.clear();
                            //             Navigator.pop(context);
                            //           },
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
                          },
                          child: commonText(
                            title: UtilStrings.tax,
                            // subTitle: tax.toStringAsPrecision(4)),
                            subTitle: totalTax.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          const Text("Add Discount"),
                                          const Gap(20),
                                          Utils.boldSubHeadingText(
                                              text: UtilStrings.discountType,
                                              textSize: 14),
                                          Consumer<PosPageViewModel>(
                                            builder: (BuildContext context,
                                                value, Widget? child) {
                                              return DropdownButton<String>(
                                                value: value.selectrange,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                dropdownColor:
                                                    AppColor.light_grey2,
                                                items: <String>[
                                                  'Fixed',
                                                  'Percentage',
                                                ].map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(
                                                      value,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? val) async {
                                                  value.selectrange = val ?? '';
                                                  value.notifyListeners();
                                                },
                                              );
                                            },
                                          ),
                                          const Gap(20),
                                          ContainerBorder(
                                            height: 50,
                                            child: Center(
                                              child: CustomTextFiled(
                                                textInputType:
                                                    TextInputType.number,
                                                textEditingController:
                                                    discountController,
                                                title: '0.00',
                                                isContentPedding: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
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
                                  title: UtilStrings.discount,
                                  subTitle: discountPrice.toString()))),
                      const Gap(10),
                      Expanded(
                        child: commonText(
                            title: UtilStrings.totalPayable,
                            subTitle: totalAmount.toStringAsPrecision(5)),
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
                          InkWell(
                            onTap: () {
                              Sell s = Sell(
                                contactId: int.parse(userId ?? '1'),
                                discountAmount: value.selectrange == 'Fixed'
                                    ? discountAmountForFix.toString()
                                    : discountAmountForPercantage.toString(),
                                discountType: value.selectrange,
                                locationId: int.parse(value.selectId),
                                taxId: taxId,
                                status: 'draft',
                                subStatus: 'quotation',
                                isQuotation: 'true',
                                payments: [
                                  Payment(
                                      amount: '$totalAmount',
                                      method: UtilStrings.quotation)
                                ],
                                products: items,
                              );
                              ReqCreateSell se = ReqCreateSell(sells: [s]);
                              showLoadingDialog(context: context);
                              Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .createSell(se, context)
                                  .then((value) {
                                if (value.isSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("My Invoice"),
                                        content: const Text(
                                            "Do you want to see invoice."),
                                        actions: [
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () async {
                                              if (await canLaunch(
                                                  Provider.of<PosPageViewModel>(
                                                          context,
                                                          listen: false)
                                                      .invoiceUrl)) {
                                                await launch(Provider.of<
                                                            PosPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .invoiceUrl);
                                              } else {
                                                throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              });
                            },
                            child: commonContainer(
                              title: 'Quote',
                              color: const Color(0xffb0bec5),
                              icon: Icons.description_outlined,
                              iconColor: AppColor.white,
                            ),
                          ),
                          const Gap(10),
                          InkWell(
                            onTap: () {
                              if (items.isEmpty) {
                                ToastUtils.showCustomToast(context,
                                    "Please Select One Item", "warning");
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Utils.boldSubHeadingText(
                                              text: "Payment", textSize: 14),
                                          const Divider(),
                                          const Gap(10),
                                          commonText(
                                              title: "Total Items",
                                              subTitle: items[0].quantity),
                                          const Gap(10),
                                          commonText(
                                              title: "Total Payable",
                                              subTitle: totalAmount.toString()),
                                          const Gap(10),
                                          commonText2(
                                              title: "Total Paying",
                                              cntrl: totalPayableController,
                                              onChanged: (String) {
                                                setState(() {
                                                  balance = totalAmount -
                                                      double.parse(
                                                          totalPayableController
                                                              .text);
                                                });
                                              }),
                                          const Gap(10),
                                          commonText(
                                              title: "Balance",
                                              subTitle: balance.toString()),
                                        ],
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: const Text('Finalize Payment'),
                                          onPressed: () {
                                            Sell s = Sell(
                                              contactId:
                                                  int.parse(userId ?? '1'),
                                              discountAmount: value
                                                          .selectrange ==
                                                      'Fixed'
                                                  ? discountAmountForFix
                                                      .toString()
                                                  : discountAmountForPercantage
                                                      .toString(),
                                              discountType: value.selectrange,
                                              locationId:
                                                  int.parse(value.selectId),
                                              taxId: taxId,
                                              payments: [
                                                Payment(
                                                    amount: '$balance',
                                                    method: UtilStrings.card)
                                              ],
                                              products: items,
                                            );
                                            ReqCreateSell se =
                                                ReqCreateSell(sells: [s]);
                                            showLoadingDialog(context: context);
                                            Provider.of<PosPageViewModel>(
                                                    context,
                                                    listen: false)
                                                .createSell(se, context)
                                                .then((value) {
                                              if (value.isSuccess) {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          "My Invoice"),
                                                      content: const Text(
                                                          "Do you want to see invoice."),
                                                      actions: [
                                                        TextButton(
                                                          child:
                                                              const Text("YES"),
                                                          onPressed: () async {
                                                            if (await canLaunch(
                                                                Provider.of<PosPageViewModel>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .invoiceUrl)) {
                                                              await launch(Provider.of<
                                                                          PosPageViewModel>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .invoiceUrl);
                                                            } else {
                                                              throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                                            }
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          child: const Text('close'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: commonContainer(
                              title: 'Multi',
                              color: const Color(0xffffb74d),
                              icon: Icons.notes_outlined,
                              iconColor: AppColor.white,
                            ),
                          ),
                          const Gap(10),
                          InkWell(
                            onTap: () {
                              Sell s = Sell(
                                contactId: int.parse(userId ?? '1'),
                                discountAmount: value.selectrange == 'Fixed'
                                    ? discountAmountForFix.toString()
                                    : discountAmountForPercantage.toString(),
                                discountType: value.selectrange,
                                locationId: int.parse(value.selectId),
                                taxId: taxId,
                                payments: [
                                  Payment(
                                      amount: '$totalAmount',
                                      method: UtilStrings.card)
                                ],
                                products: items,
                              );
                              ReqCreateSell se = ReqCreateSell(sells: [s]);
                              showLoadingDialog(context: context);
                              Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .createSell(se, context)
                                  .then((value) {
                                if (value.isSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("My Invoice"),
                                        content: const Text(
                                            "Do you want to see invoice."),
                                        actions: [
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () async {
                                              if (await canLaunch(
                                                  Provider.of<PosPageViewModel>(
                                                          context,
                                                          listen: false)
                                                      .invoiceUrl)) {
                                                await launch(Provider.of<
                                                            PosPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .invoiceUrl);
                                              } else {
                                                throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
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
                          InkWell(
                            onTap: () {
                              Sell s = Sell(
                                contactId: int.parse(userId ?? '1'),
                                taxId: taxId,
                                // taxAmount: tax.toString(),
                                discountAmount: value.selectrange == 'Fixed'
                                    ? discountAmountForFix.toString()
                                    : discountAmountForPercantage.toString(),
                                discountType: value.selectrange,
                                locationId: int.parse(value.selectId),

                                payments: [
                                  Payment(
                                      amount: '$subTotal',
                                      method: UtilStrings.cash)
                                ],
                                products: items,
                              );
                              ReqCreateSell se = ReqCreateSell(sells: [s]);
                              showLoadingDialog(context: context);
                              Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .createSell(se, context)
                                  .then((value) {
                                if (value.isSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("My Invoice"),
                                        content: const Text(
                                            "Do you want to see invoice."),
                                        actions: [
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () async {
                                              if (await canLaunch(
                                                  Provider.of<PosPageViewModel>(
                                                          context,
                                                          listen: false)
                                                      .invoiceUrl)) {
                                                await launch(Provider.of<
                                                            PosPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .invoiceUrl);
                                              } else {
                                                throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              });
                            },
                            child: commonContainer(
                              title: UtilStrings.cash,
                              color: const Color(0xff81c784),
                              icon: Icons.monetization_on_outlined,
                              iconColor: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    FittedBox(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Sell s = Sell(
                                contactId: int.parse(userId ?? '1'),
                                discountAmount: value.selectrange == 'Fixed'
                                    ? discountAmountForFix.toString()
                                    : discountAmountForPercantage.toString(),
                                discountType: value.selectrange,
                                locationId: int.parse(value.selectId),
                                taxId: taxId,
                                payments: [
                                  Payment(amount: '0', method: UtilStrings.cash)
                                ],
                                products: items,
                              );
                              ReqCreateSell se = ReqCreateSell(sells: [s]);
                              showLoadingDialog(context: context);
                              Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .createSell(se, context)
                                  .then((value) {
                                if (value.isSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("My Invoice"),
                                        content: const Text(
                                            "Do you want to see invoice."),
                                        actions: [
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () async {
                                              if (await canLaunch(
                                                  Provider.of<PosPageViewModel>(
                                                          context,
                                                          listen: false)
                                                      .invoiceUrl)) {
                                                await launch(Provider.of<
                                                            PosPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .invoiceUrl);
                                              } else {
                                                throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              });
                            },
                            child: commonContainer(
                              title: 'Credit',
                              color: const Color(0xff9575cd),
                              icon: Icons.check,
                              iconColor: AppColor.white,
                            ),
                          ),
                          const Gap(10),
                          InkWell(
                            onTap: () {
                              Sell s = Sell(
                                contactId: int.parse(userId ?? '1'),
                                discountAmount: value.selectrange == 'Fixed'
                                    ? discountAmountForFix.toString()
                                    : discountAmountForPercantage.toString(),
                                discountType: value.selectrange,
                                locationId: int.parse(value.selectId),
                                taxId: taxId,
                                payments: [
                                  Payment(
                                      amount: '$totalAmount',
                                      method: UtilStrings.other)
                                ],
                                products: items,
                              );
                              ReqCreateSell se = ReqCreateSell(sells: [s]);
                              showLoadingDialog(context: context);
                              Provider.of<PosPageViewModel>(context,
                                      listen: false)
                                  .createSell(se, context)
                                  .then((value) {
                                if (value.isSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("My Invoice"),
                                        content: const Text(
                                            "Do you want to see invoice."),
                                        actions: [
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () async {
                                              if (await canLaunch(
                                                  Provider.of<PosPageViewModel>(
                                                          context,
                                                          listen: false)
                                                      .invoiceUrl)) {
                                                await launch(Provider.of<
                                                            PosPageViewModel>(
                                                        context,
                                                        listen: false)
                                                    .invoiceUrl);
                                              } else {
                                                throw "Could not launch https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96";
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              });
                            },
                            child: commonContainer(
                              title: UtilStrings.other,
                              color: const Color(0xffaed581),
                              icon: Icons.notes_outlined,
                              iconColor: AppColor.white,
                            ),
                          ),
                          const Gap(10),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    title: const Text("Are You Sure"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                        onPressed: () {
                                          userController.clear();
                                          productController.clear();
                                          setState(() {
                                            Provider.of<PosPageViewModel>(
                                                    context,
                                                    listen: false)
                                                .cartItemList
                                                .clear();
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: commonContainer(
                              title: 'Cancel',
                              color: const Color(0xfff06292),
                              icon: Icons.cancel,
                              iconColor: AppColor.white,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 90,
                            color: Colors.transparent,
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

  commonTile({required String text, required String subText}) {
    return Row(
      children: [
        Utils.mediumHeadingText(text: "$text:"),
        const Gap(5),
        Utils.regularHeadingText(text: subText)
      ],
    );
  }

  Widget productContainer({
    required BuildContext context,
    required String title,
    required int index,
    required String price,
    required int qty,
    required Items item,
    TextEditingController? subTotalController,
    TextEditingController? quantityController,
  }) {
    return Container(
        height: 60,
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
                          onTap: () async {
                            await player.setAsset(UtilStrings.soundPath);
                            player.play();
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
                        Expanded(child: Utils.mediumHeadingText(text: title)),
                      ],
                    ),
                  ),

                  /// Quantity....
                  Expanded(
                    child: Column(
                      children: [
                        const Gap(10),
                        Container(
                          height: 30,
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
                                    onTap: () async {
                                      isSubtotalEditable = false;
                                      isQuantityEditable = false;
                                      // subTotalFocus.unfocus();
                                      // quantityFocus.unfocus();
                                      await player
                                          .setAsset(UtilStrings.soundPath);
                                      player.play();
                                      value.removeCounter(item);
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.remove,
                                          size: 25,
                                          color: AppColor.red,
                                        ),
                                        Utils.customVerticalDivider(),
                                      ],
                                    )),
                                if (isQuantityEditable == true)
                                  Container(
                                    width: 20,
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: TextFormField(
                                      autofocus: true,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: AppColor.black,
                                        fontSize: 14,
                                      ),
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      focusNode: quantityFocus,
                                      initialValue: qty.toString(),
                                      controller: quantityController,
                                      onFieldSubmitted: (val) {
                                        isQuantityEditable = false;
                                        setState(() {});
                                      },
                                      onChanged: (val) {
                                        item.itemCounter = int.parse(val);
                                      },
                                    ),
                                  )
                                else
                                  GestureDetector(
                                      onTap: () {
                                        isQuantityEditable = true;
                                        // FocusScope.of(context).requestFocus(quantityFocus);
                                        setState(() {});
                                      },
                                      child: Utils.smallHeadingText(
                                          text: '$qty', textSize: 14)),
                                InkWell(
                                    onTap: () async {
                                      isSubtotalEditable = false;
                                      isQuantityEditable = false;
                                      // subTotalFocus.unfocus();
                                      // quantityFocus.unfocus();
                                      await player
                                          .setAsset(UtilStrings.soundPath);
                                      player.play();
                                      value.addCounter(item);
                                    },
                                    child: Row(
                                      children: [
                                        Utils.customVerticalDivider(),
                                        const Icon(
                                          Icons.add,
                                          size: 25,
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
                        if (isSubtotalEditable == true)
                          Container(
                              height: 30,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColor.blue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.only(bottom: 5),
                              child: TextFormField(
                                autofocus: true,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                textAlignVertical: TextAlignVertical.center,
                                focusNode: subTotalFocus,
                                // initialValue: '000',
                                initialValue:
                                (double.parse(price) * item.itemCounter)
                                    .toStringAsFixed(2),
                                controller: subTotalController,
                                onFieldSubmitted: (val) {
                                  isSubtotalEditable = false;
                                  setState(() {});
                                },
                                onChanged: (val) {
                                  var newPrice =
                                      double.parse(val) / item.itemCounter;
                                  item.productVariations[0].variations[0]
                                      .defaultSellPrice =
                                      newPrice.toStringAsFixed(2);
                                  print(
                                      "PRICE IS ${item.productVariations[0].variations[0].defaultSellPrice}");
                                },
                              ))
                        else
                          InkWell(
                            onTap: () {
                              isSubtotalEditable = true;
                              // FocusScope.of(context).unfocus();
                              // FocusScope.of(context).requestFocus(subTotalFocus);
                              print("HELLO$isSubtotalEditable");
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColor.blue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Utils.boldSubHeadingText(
                                // text: "122",
                                  text: (double.parse(price) * item.itemCounter)
                                      .toStringAsFixed(2),
                                  textSize: 12,
                                  color: AppColor.blue),
                            ),
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
            Icon(icon, color: iconColor, size: 22),
            const Gap(3),
            FittedBox(
              child: Utils.mediumHeadingText(
                  text: title, textSize: 14, color: AppColor.white),
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

  Widget commonText2(
      {required String title,
      Color? color,
      TextEditingController? cntrl,
      void Function(String)? onChanged}) {
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
          child: TextField(
            style: const TextStyle(color: AppColor.blue, fontSize: 15),
            onChanged: onChanged,
            controller: cntrl,
          ),
        ),
      ],
    );
  }
}

class StateService {
  static Future<List<User>> getSuggestions(
      String query, BuildContext context) async {
    List<User> searchedUser = [];
    searchedUser.addAll(
        Provider.of<PosPageViewModel>(context, listen: false).usersList);
    searchedUser.retainWhere((s) {
      return s.id!.toLowerCase().contains(query.toLowerCase()) ||
          s.name!.toLowerCase().contains(query.toLowerCase());
    });

    return searchedUser;
  }

  static Future<List<Items>> getProductSuggestions(
      String query, BuildContext context) async {
    List<Items> products = [];
    products.addAll(
        Provider.of<PosPageViewModel>(context, listen: false).productsList);
    products.retainWhere((s) {
      return s.name.toLowerCase().contains(query.toLowerCase()) ||
          s.sku.toLowerCase().contains(query.toLowerCase());
    });
    return products;
  }

  static Future<List<Location>> getLocationSuggestions(
      String query, BuildContext context) async {
    List<Location> locations = [];
    locations.addAll(
        Provider.of<PosPageViewModel>(context, listen: false).locationList);
    locations.retainWhere((s) {
      return s.locationId!.toLowerCase().contains(query.toLowerCase());
    });
    return locations;
  }

  static Future<List<Taxes>> getTaxSuggestions(
      String query, BuildContext context) async {
    List<Taxes> taxes = [];

    taxes.addAll(
        Provider.of<PosPageViewModel>(context, listen: false).taxesList);
    taxes.retainWhere((s) {
      return s.name!.toLowerCase().contains(query.toLowerCase());
    });
    return taxes;
  }
}
