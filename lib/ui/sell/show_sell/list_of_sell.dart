// import 'dart:async';
// import 'dart:collection';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:gap/gap.dart';
// import 'package:pos/ui/sell/return_sell/return_sell_page.dart';
// import 'package:pos/utils/color_utils.dart';
// import 'package:pos/utils/string_utils.dart';
// import 'package:pos/utils/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:url_launcher/url_launcher.dart';
//
// import 'list_of_sell_view_model.dart';
//
// class ListOfSellPage extends StatefulWidget {
//   const ListOfSellPage({Key? key}) : super(key: key);
//
//   @override
//   _ListOfSellPageState createState() => _ListOfSellPageState();
// }
//
// class _ListOfSellPageState extends State<ListOfSellPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadData();
//   }
//
//   void loadData() async {
//     await Provider.of<ListOfSellViewModel>(context, listen: false).sellList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Utils.customAppBar(
//           text: UtilStrings.sellList,
//           icon: Icons.info_outlined,
//           onTap: () {
//             Navigator.pop(context);
//           }),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: Consumer<ListOfSellViewModel>(
//           builder: (BuildContext context, value, Widget? child) {
//             if (value.isLoading == true) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return ListView.builder(
//               itemCount: value.sellItemList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 if (value.selllist != null) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         color: AppColor.light_white,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.all(10),
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text('ID :->'),
//                                   Text(value.sellItemList[index].id),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Text('Business ID :->'),
//                                   Text(value.sellItemList[index].businessId),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Text('Final Amount :->'),
//                                   Text(value.sellItemList[index].finalTotal),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                             child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 // print(
//                                 //     'Your nae ${value.sellItemList[index].invoiceUrl}');
//                                 Navigator.push(context, MaterialPageRoute(
//                                     builder: (BuildContext context) {
//                                   return OpenInvoice();
//                                 }));
//                                 // OpenInvoice();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColor.blue,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 padding: const EdgeInsets.all(10),
//                                 child: Utils.smallHeadingText(
//                                     text: 'View Invoice',
//                                     color: AppColor.white),
//                               ),
//                             ),
//                             const Gap(10),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(
//                                     builder: (BuildContext context) {
//                                   return ReturnSellPage(
//                                     item: value.sellItemList[index],
//                                   );
//                                 }));
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColor.blue,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 padding: const EdgeInsets.all(10),
//                                 child: Utils.smallHeadingText(
//                                     text: 'Return Sale', color: AppColor.white),
//                               ),
//                             )
//                           ],
//                         ))
//                       ],
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   // _launchURL(String url) async {
//   //   if (await canLaunch(url)) {
//   //     await launch(url);
//   //   } else {
//   //     throw 'Could not launch $url';
//   //   }
//   // }
//   // Future<void> _launchURL(BuildContext context,String url) async {
//   //   final theme = Theme.of(context);
//   //   try {
//   //     await launch(
//   //       url,
//   //       customTabsOption: CustomTabsOption(
//   //         toolbarColor: theme.primaryColor,
//   //         enableDefaultShare: true,
//   //         enableUrlBarHiding: true,
//   //         showPageTitle: true,
//   //         animation: CustomTabsSystemAnimation.slideIn(),
//   //         extraCustomTabs: const <String>[
//   //           'org.mozilla.firefox',
//   //           'com.microsoft.emmx',
//   //         ],
//   //       ),
//   //       safariVCOption: SafariViewControllerOption(
//   //         preferredBarTintColor: theme.primaryColor,
//   //         preferredControlTintColor: Colors.white,
//   //         barCollapsingEnabled: true,
//   //         entersReaderIfAvailable: false,
//   //         dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     // An exception is thrown if browser app is not installed on Android device.
//   //     debugPrint(e.toString());
//   //   }
//   // }
//
// }
//
// // class OpenPdf extends StatefulWidget {
// //   final String url;
// //   const OpenPdf({Key? key, required this.url}) : super(key: key);
// //
// //   @override
// //   State<OpenPdf> createState() => _OpenPdfState();
// // }
// //
// // class _OpenPdfState extends State<OpenPdf> {
// //   final Completer<WebViewController> _controller =
// //       Completer<WebViewController>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     if (Platform.isAndroid) {
// //       WebView.platform = SurfaceAndroidWebView();
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: WebView(
// //         // initialUrl:
// //             // 'https://flutter.dev',
// // initialUrl: 'https://erpx.shajan-sa.com/invoice/965aeb4b59a5085f8f5414d4405d766e',
// //         javascriptMode: JavascriptMode.unrestricted,
// //         onWebViewCreated: (WebViewController webViewController) {
// //           _controller.complete(webViewController);
// //         },
// //         onProgress: (int progress) {
// //           print('WebView is loading (progress : $progress%)');
// //         },
// //         javascriptChannels: <JavascriptChannel>{
// //           // _toasterJavascriptChannel(context),
// //         },
// //       ),
// //     );
// //   }
// //   // Future<void> _launchURL(BuildContext context) async {
// //   //   final theme = Theme.of(context);
// //   //   try {
// //   //     await launch(
// //   //       'https://flutter.dev',
// //   //       customTabsOption: CustomTabsOption(
// //   //         toolbarColor: theme.primaryColor,
// //   //         enableDefaultShare: true,
// //   //         enableUrlBarHiding: true,
// //   //         showPageTitle: true,
// //   //         animation: CustomTabsSystemAnimation.slideIn(),
// //   //         extraCustomTabs: const <String>[
// //   //           'org.mozilla.firefox',
// //   //           'com.microsoft.emmx',
// //   //         ],
// //   //       ),
// //   //       safariVCOption: SafariViewControllerOption(
// //   //         preferredBarTintColor: theme.primaryColor,
// //   //         preferredControlTintColor: Colors.white,
// //   //         barCollapsingEnabled: true,
// //   //         entersReaderIfAvailable: false,
// //   //         dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
// //   //       ),
// //   //     );
// //   //   } catch (e) {
// //   //     // An exception is thrown if browser app is not installed on Android device.
// //   //     debugPrint(e.toString());
// //   //   }
// //   // }
// // }
//
// class OpenInvoice extends StatefulWidget {
//   const OpenInvoice({Key? key}) : super(key: key);
//
//   @override
//   State<OpenInvoice> createState() => _OpenInvoiceState();
// }
//
// class _OpenInvoiceState extends State<OpenInvoice> {
//   final GlobalKey webViewKey = GlobalKey();
//   String? compnaylink;
//
//   InAppWebViewController? webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));
//
//   late PullToRefreshController pullToRefreshController;
//   late ContextMenu contextMenu;
//   String url = "";
//   double progress = 0;
//   final urlController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     contextMenu = ContextMenu(
//         menuItems: [
//           ContextMenuItem(
//               androidId: 1,
//               iosId: "1",
//               title: "Special",
//               action: () async {
//                 print("Menu item Special clicked!");
//                 print(await webViewController?.getSelectedText());
//                 await webViewController?.clearFocus();
//               })
//         ],
//         options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
//         onCreateContextMenu: (hitTestResult) async {
//           print("onCreateContextMenu");
//           print(hitTestResult.extra);
//           print(await webViewController?.getSelectedText());
//         },
//         onHideContextMenu: () {
//           print("onHideContextMenu");
//         },
//         onContextMenuActionItemClicked: (contextMenuItemClicked) async {
//           var id = (Platform.isAndroid)
//               ? contextMenuItemClicked.androidId
//               : contextMenuItemClicked.iosId;
//           print("onContextMenuActionItemClicked: " +
//               id.toString() +
//               " " +
//               contextMenuItemClicked.title);
//         });
//
//     pullToRefreshController = PullToRefreshController(
//       options: PullToRefreshOptions(
//         color: Colors.blue,
//       ),
//       onRefresh: () async {
//         if (Platform.isAndroid) {
//           webViewController?.reload();
//         } else if (Platform.isIOS) {
//           webViewController?.loadUrl(
//               urlRequest: URLRequest(url: await webViewController?.getUrl()));
//         }
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: InAppWebView(
//         key: webViewKey,
//         // contextMenu: contextMenu,
//         initialUrlRequest: URLRequest(
//             url: Uri.parse('https://erpx.shajan-sa.com/invoice/cae9ca96fa6bb77ac0ba9291da421f96')),
//         // initialFile: "assets/index.html",
//         initialUserScripts: UnmodifiableListView<UserScript>([]),
//         initialOptions: options,
//         pullToRefreshController: pullToRefreshController,
//         onWebViewCreated: (controller) {
//           webViewController = controller;
//         },
//         onLoadStart: (controller, url) {
//           setState(() {
//             this.url = url.toString();
//             urlController.text = this.url;
//           });
//         },
//         androidOnPermissionRequest:
//             (controller, origin, resources) async {
//           return PermissionRequestResponse(
//               resources: resources,
//               action: PermissionRequestResponseAction.GRANT);
//         },
//         // shouldOverrideUrlLoading: (controller, navigationAction) async {
//         //   var uri = navigationAction.request.url!;
//
//         //   if (![
//         //     "http",
//         //     "https",
//         //     "file",
//         //     "chrome",
//         //     "data",
//         //     "javascript",
//         //     "about"
//         //   ].contains(uri.scheme)) {
//         //     if (await canLaunch(url)) {
//         //       // Launch the App
//         //       await launch(
//         //         url,
//         //       );
//         //       // and cancel the request
//         //       return NavigationActionPolicy.CANCEL;
//         //     }
//         //   }
//
//         //   return NavigationActionPolicy.ALLOW;
//         // },
//         onLoadStop: (controller, url) async {
//           pullToRefreshController.endRefreshing();
//           setState(() {
//             this.url = url.toString();
//             urlController.text = this.url;
//           });
//         },
//         onLoadError: (controller, url, code, message) {
//           pullToRefreshController.endRefreshing();
//         },
//         onProgressChanged: (controller, progress) {
//           if (progress == 100) {
//             pullToRefreshController.endRefreshing();
//           }
//           setState(() {
//             this.progress = progress / 100;
//             urlController.text = this.url;
//           });
//         },
//         onUpdateVisitedHistory: (controller, url, androidIsReload) {
//           setState(() {
//             this.url = url.toString();
//             urlController.text = this.url;
//           });
//         },
//         onConsoleMessage: (controller, consoleMessage) {
//           print(consoleMessage);
//         },
//       ),
//     );
//   }
// }
//
//
// //
// // import 'dart:collection';
// // // import 'dart:convert';
// // import 'dart:io';
// // // import 'dart:typed_data';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'package:path_provider/path_provider.dart';
// //
// // // import 'main.dart';
// //
// // class InAppWebViewExampleScreen extends StatefulWidget {
// //   @override
// //   _InAppWebViewExampleScreenState createState() =>
// //       new _InAppWebViewExampleScreenState();
// // }
// //
// // class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
// //   final GlobalKey webViewKey = GlobalKey();
// //
// //
// //   InAppWebViewController? webViewController;
// //   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
// //       crossPlatform: InAppWebViewOptions(
// //         useShouldOverrideUrlLoading: true,
// //         mediaPlaybackRequiresUserGesture: false,
// //       ),
// //       android: AndroidInAppWebViewOptions(
// //         useHybridComposition: true,
// //       ),
// //       ios: IOSInAppWebViewOptions(
// //         allowsInlineMediaPlayback: true,
// //       ));
// //
// //   late PullToRefreshController pullToRefreshController;
// //   late ContextMenu contextMenu;
// //   String url = "";
// //   double progress = 0;
// //   final urlController = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     contextMenu = ContextMenu(
// //         menuItems: [
// //           ContextMenuItem(
// //               androidId: 1,
// //               iosId: "1",
// //               title: "Special",
// //               action: () async {
// //                 print("Menu item Special clicked!");
// //                 print(await webViewController?.getSelectedText());
// //                 await webViewController?.clearFocus();
// //               })
// //         ],
// //         options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
// //         onCreateContextMenu: (hitTestResult) async {
// //           print("onCreateContextMenu");
// //           print(hitTestResult.extra);
// //           print(await webViewController?.getSelectedText());
// //         },
// //         onHideContextMenu: () {
// //           print("onHideContextMenu");
// //         },
// //         onContextMenuActionItemClicked: (contextMenuItemClicked) async {
// //           var id = (Platform.isAndroid)
// //               ? contextMenuItemClicked.androidId
// //               : contextMenuItemClicked.iosId;
// //           print("onContextMenuActionItemClicked: " +
// //               id.toString() +
// //               " " +
// //               contextMenuItemClicked.title);
// //         });
// //
// //     pullToRefreshController = PullToRefreshController(
// //       options: PullToRefreshOptions(
// //         color: Colors.blue,
// //       ),
// //       onRefresh: () async {
// //         if (Platform.isAndroid) {
// //           webViewController?.reload();
// //         } else if (Platform.isIOS) {
// //           webViewController?.loadUrl(
// //               urlRequest: URLRequest(url: await webViewController?.getUrl()));
// //         }
// //       },
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //
// //         actions: [
// //           Expanded(
// //
// //             child: InkWell(onTap: (){
// //               webViewController?.goBack();
// //             },
// //                 child : Icon(Icons.arrow_back)),
// //           ),
// //           Expanded(
// //               flex: 5,
// //               child: Center(child: Text("SmartX",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),))),
// //           Expanded(
// //             child: InkWell(
// //               onTap: () {
// //               },
// //               child: Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 8.0),
// //                 child: Icon(Icons.info),
// //               ),
// //             ),
// //           ),
// //
// //
// //         ],
// //         toolbarHeight: 40,
// //         backgroundColor: const Color(0xFF243949),
// //         // title: const Padding(
// //         //   padding: EdgeInsets.only(bottom: 8.0),
// //         //   child: ,
// //         // )
// //       ),
// //       body: Container(
// //         color: Colors.transparent,
// //         child: Column(children: <Widget>[
// //           // TextField(
// //           //   decoration: InputDecoration(
// //           //       prefixIcon: Icon(Icons.search)
// //           //   ),
// //           //   controller: urlController,
// //           //   keyboardType: TextInputType.url,
// //           //   onSubmitted: (value) {
// //           //     var url = Uri.parse(value);
// //           //     if (url.scheme.isEmpty) {
// //           //       url = Uri.parse("https://www.google.com/search?q=" + value);
// //           //     }
// //           //     webViewController?.loadUrl(
// //           //         urlRequest: URLRequest(url: url));
// //           //   },
// //           // ),
// //           Expanded(
// //             child: Stack(
// //               children: [
// //                 InAppWebView(
// //                   key: webViewKey,
// //                   // contextMenu: contextMenu,
// //                   initialUrlRequest: URLRequest(
// //                       url: Uri.parse('https://erpx.shajan-sa.com/invoice/d44387046bdddcb7401377649e8a16c1')),
// //                   // initialFile: "assets/index.html",
// //                   initialUserScripts: UnmodifiableListView<UserScript>([]),
// //                   initialOptions: options,
// //                   pullToRefreshController: pullToRefreshController,
// //                   onWebViewCreated: (controller) {
// //                     webViewController = controller;
// //                   },
// //                   onLoadStart: (controller, url) {
// //                     setState(() {
// //                       this.url = url.toString();
// //                       urlController.text = this.url;
// //                     });
// //                   },
// //                   androidOnPermissionRequest:
// //                       (controller, origin, resources) async {
// //                     return PermissionRequestResponse(
// //                         resources: resources,
// //                         action: PermissionRequestResponseAction.GRANT);
// //                   },
// //                   // shouldOverrideUrlLoading: (controller, navigationAction) async {
// //                   //   var uri = navigationAction.request.url!;
// //
// //                   //   if (![
// //                   //     "http",
// //                   //     "https",
// //                   //     "file",
// //                   //     "chrome",
// //                   //     "data",
// //                   //     "javascript",
// //                   //     "about"
// //                   //   ].contains(uri.scheme)) {
// //                   //     if (await canLaunch(url)) {
// //                   //       // Launch the App
// //                   //       await launch(
// //                   //         url,
// //                   //       );
// //                   //       // and cancel the request
// //                   //       return NavigationActionPolicy.CANCEL;
// //                   //     }
// //                   //   }
// //
// //                   //   return NavigationActionPolicy.ALLOW;
// //                   // },
// //                   onLoadStop: (controller, url) async {
// //                     pullToRefreshController.endRefreshing();
// //                     setState(() {
// //                       this.url = url.toString();
// //                       urlController.text = this.url;
// //                     });
// //                   },
// //                   onLoadError: (controller, url, code, message) {
// //                     pullToRefreshController.endRefreshing();
// //                   },
// //                   onProgressChanged: (controller, progress) {
// //                     if (progress == 100) {
// //                       pullToRefreshController.endRefreshing();
// //                     }
// //                     setState(() {
// //                       this.progress = progress / 100;
// //                       urlController.text = this.url;
// //                     });
// //                   },
// //                   onUpdateVisitedHistory: (controller, url, androidIsReload) {
// //                     setState(() {
// //                       this.url = url.toString();
// //                       urlController.text = this.url;
// //                     });
// //                   },
// //                   onConsoleMessage: (controller, consoleMessage) {
// //                     print(consoleMessage);
// //                   },
// //                 ),
// //                 progress < 1.0
// //                     ? LinearProgressIndicator(value: progress)
// //                     : SizedBox(),
// //               ],
// //             ),
// //           ),
// //           // Padding(
// //           //   padding: const EdgeInsets.only(bottom :18.0),
// //           //   child: Row(
// //           //     mainAxisSize: MainAxisSize.min,
// //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           //     // buttonHeight :20 ,
// //           //     // alignment: MainAxisAlignment.center,
// //           //     children: <Widget>[
// //           //       ElevatedButton(
// //           //         child: const Icon(Icons.arrow_back),
// //           //         onPressed: () {
// //           //           webViewController?.goBack();
// //           //         },
// //           //       ),
// //           //       Padding(
// //           //         padding: const EdgeInsets.symmetric(horizontal: 5),
// //           //         child: ElevatedButton(
// //           //           child: const Icon(Icons.refresh),
// //           //           onPressed: () {
// //           //             webViewController?.reload();
// //           //           },
// //           //         ),
// //           //       ),
// //           //       ElevatedButton(
// //           //         child: const Icon(Icons.arrow_forward),
// //           //         onPressed: () {
// //           //           webViewController?.goForward();
// //           //         },
// //           //       ),
// //           //     ],
// //           //   ),
// //           // ),
// //         ]),
// //       ));
// //   }
// //
// //
// // }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pos/data/models/pos/res_business_location.dart';
import 'package:pos/data/models/pos/res_users_pos.dart';
import 'package:pos/ui/pos/pos_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/ui/sell/return_sell/return_sell_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/custom_button.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/toast_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/container_border.dart';
import 'package:pos/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';

import 'list_of_sell_view_model.dart';

class ListOfSellPage extends StatefulWidget {
  const ListOfSellPage({Key? key}) : super(key: key);

  @override
  State<ListOfSellPage> createState() => _ListOfSellPageState();
}

class _ListOfSellPageState extends State<ListOfSellPage> {

  late TextEditingController locationController = TextEditingController();
  late TextEditingController customerController = TextEditingController();
  late TextEditingController paymentStatusController = TextEditingController();
  late TextEditingController userController = TextEditingController();
  late TextEditingController shippingStatusController = TextEditingController();
  late TextEditingController amountController = TextEditingController();
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    await Provider.of<ListOfSellViewModel>(context, listen: false).sellList();
    await Provider.of<PosPageViewModel>(context, listen: false).businessList();
    await Provider.of<PosPageViewModel>(context, listen: false).userList();
    await Provider.of<PosPageViewModel>(context, listen: false)
        .productList(context: context);

    Location data = Location(name: 'all', id: 'all', locationId: "");
    Provider.of<PosPageViewModel>(context, listen: false)
        .locationList
        .insert(0, data);
    User data2 = User(name: 'all', id: 'all');
    Provider.of<PosPageViewModel>(context, listen: false)
        .usersList
        .insert(0, data2);

    // await Provider.of<PosPageViewModel>(context, listen: false).userList();
    // Provider.of<ListOfSellViewModel>(context, listen: false).userList.addAll(Provider.of<PosPageViewModel>(context, listen: false).usersList);
  }

  late ListOfSellViewModel listOfSellViewModel;
  int index = 0;
  String dropdownValue = 'Cash';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                            onTap: () {
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
                              Text('List of sell',
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
              Consumer<ListOfSellViewModel>(builder: (BuildContext context, value, Widget? child) {
                if(value.isLoading == true)
                {
                  return SizedBox(height: Utils.getHeight(context),width: Utils.getWidth(context),child: const Center(child: CircularProgressIndicator( )));
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(15),

                    /// Filter Button...
                    InkWell(
                      onTap: () {
                        showDialogBox();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.filter_list_outlined,
                            ),
                            Utils.mediumHeadingText(text: 'Flters', textSize: 15),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 45,
                      width: Utils.getWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: AppColor.grey2,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Utils.mediumHeadingText(
                                  text: 'Invoice No.',
                                  color: AppColor.dark_green,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700)),
                          Utils.customVerticalDivider(),
                          Expanded(
                              child: Utils.mediumHeadingText(
                                  text: 'Payment status',
                                  color: AppColor.dark_green,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700)),
                          Utils.customVerticalDivider(),
                          Expanded(
                              child: Utils.mediumHeadingText(
                                  text: 'Payment method',
                                  color: AppColor.dark_green,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700)),
                          Utils.customVerticalDivider(),
                          Expanded(
                              child: Utils.mediumHeadingText(
                                  text: 'Total amount',
                                  color: AppColor.dark_green,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700)),
                          Utils.customVerticalDivider(),
                          Expanded(
                              child: Utils.mediumHeadingText(
                                  text: 'Customer name',
                                  color: AppColor.dark_green,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Consumer<ListOfSellViewModel>(
                      builder: (BuildContext context, value, Widget? child) {
                        return SizedBox(
                          height: Utils.getHeight(context) * 0.76,
                          width: Utils.getWidth(context),
                          child: ListView.builder(
                              itemCount: value.sellItemList.length,
                              itemBuilder: (context, index) {
                                return SwipeActionCell(
                                  key: const ObjectKey(10),
                                  ///this key is necessary
                                  trailingActions: <SwipeAction>[
                                    SwipeAction(
                                        backgroundRadius: 20,
                                        title: "Add",
                                        onTap:
                                            (CompletionHandler handler) async {
                                          if(value.sellItemList[index].paymentStatus == 'paid')
                                          {
                                            ToastUtils.showCustomToast(context, "Alreasy Paid", "warning");
                                          }
                                          else
                                          {
                                            showLoadingDialog(
                                                  context: context);
                                              // await Provider.of<
                                              //             ListOfSellViewModel>(
                                              //         context,
                                              //         listen: false)
                                              //     .getSpecifiedContact(
                                              //         contactId: value
                                              //                 .sellItemList[
                                              //                     index]
                                              //                 .contactId ??
                                              //             '',
                                              //         context: context);
                                              // var name = Provider.of<
                                              //             ListOfSellViewModel>(
                                              //         context,
                                              //         listen: false)
                                              //     .specifiedContactList[0]
                                              //     .name;
                                              // print("NAMEIS ${name}");
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Utils
                                                          .boldSubHeadingText(
                                                        text: "Add Payment",
                                                      ),
                                                      content: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                      children: [
                                                          commonTile(
                                                              text: 'Customer',
                                                              subText: value
                                                                  .sellItemList[
                                                                      index]
                                                                  .contact!
                                                                  .name
                                                                  .toString()),
                                                          const Gap(5),
                                                          commonTile(
                                                              text:
                                                                  'Invoice No.',
                                                              subText:
                                                                  '#${value.sellItemList[index].invoiceNo}'),
                                                          const Gap(5),
                                                          commonTile(
                                                              text: 'Location',
                                                              subText: value
                                                                      .sellItemList[
                                                                          index]
                                                                      .locationId ??
                                                                  ""),
                                                          const Gap(5),
                                                          commonTile(
                                                              text: 'Date',
                                                              subText: DateFormat(
                                                                      'dd/MM/yyyy')
                                                                  .format(DateTime.parse(value
                                                                          .sellItemList[
                                                                              index]
                                                                          .transactionDate ??
                                                                      ""))),
                                                          const Gap(5),
                                                          commonTile(
                                                              text:
                                                                  'Advance Balance',
                                                              subText: value
                                                                      .sellItemList[
                                                                          index]
                                                                      .rpRedeemedAmount ??
                                                                  ''),
                                                          const Gap(5),
                                                          commonTile(
                                                              text:
                                                                  'total amount',
                                                              subText: value
                                                                      .sellItemList[
                                                                          index]
                                                                      .finalTotal ??
                                                                  ""),
                                                          const Gap(5),
                                                          Utils
                                                              .mediumHeadingText(
                                                                  text:
                                                                      "Amount"),
                                                          ContainerBorder(
                                                            child: TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  amountController,
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  double x = double.parse(
                                                                      amountController
                                                                          .text);
                                                                  double min =
                                                                      0.0;
                                                                  double max = double.parse(value
                                                                          .sellItemList[
                                                                              index]
                                                                          .finalTotal ??
                                                                      "");
                                                                  try {
                                                                    x = double
                                                                        .parse(
                                                                            val);
                                                                  } catch (error) {
                                                                    x = min;
                                                                  }
                                                                  if (x < min) {
                                                                    x = min;
                                                                  } else if (x >
                                                                      max) {
                                                                    ToastUtils.showCustomToast(
                                                                        context,
                                                                        "Maximum amount is ${value.sellItemList[index].finalTotal}",
                                                                        "warning");
                                                                    x = max;
                                                                  }
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          commonTile(
                                                              text:
                                                                  'Payment Account',
                                                              subText: value
                                                                      .sellItemList[
                                                                          index]
                                                                      .preferPaymentAccount ??
                                                                  ""),
                                                          Row(
                                                            children: [
                                                              Utils.mediumHeadingText(
                                                                  text:
                                                                      "Payment Method:"),
                                                              commonDropDown()
                                                            ],
                                                          )
                                                        ],
                                                    ),
                                                    actions: [
                                                      FlatButton(
                                                        child: const Text('Close'),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: const Text('Save'),
                                                        onPressed: () {
                                                          // if(amountController.text == value.sellItemList[index].finalTotal.){
                                                          print(
                                                                "HHH${value.sellItemList[index].sellLines?[0].id}");
                                                            Provider.of<ListOfSellViewModel>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .addPayment(
                                                                    sellID: value
                                                                            .sellItemList[
                                                                                index]
                                                                            .sellLines?[
                                                                                0]
                                                                            .id ??
                                                                        "",
                                                                    payment:
                                                                        amountController
                                                                            .text)
                                                                .then((value) {
                                                              _launchURL(Provider.of<
                                                                              ListOfSellViewModel>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .paymentUrl ??
                                                                  '');
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                            // }
                                                          // _launchURL(value
                                                          //     .sellItemList[index]
                                                          //     .invoiceUrl);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                }
                                            );
                                          }
                                        },
                                        color: Colors.blue),
                                    SwipeAction(
                                        backgroundRadius: 20,
                                        title: "View",
                                        onTap: (CompletionHandler handler) async {
                                            // showLoadingDialog(context: context);
                                            // await Provider.of<
                                            //             ListOfSellViewModel>(
                                            //         context,
                                            //         listen: false)
                                            //     .getSpecifiedContact(
                                            //         contactId: value
                                            //                 .sellItemList[index]
                                            //                 .contactId ??
                                            //             "",
                                            //         context: context);
                                            // var businessname = Provider.of<
                                            //             ListOfSellViewModel>(
                                            //         context,
                                            //         listen: false)
                                            //     .specifiedContactList[0]
                                            //     .supplierBusinessName;
                                            // var name = Provider.of<
                                            //             ListOfSellViewModel>(
                                            //         context,
                                            //         listen: false)
                                            //     .specifiedContactList[0]
                                            //     .name;
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "View Payments (${value.sellItemList[index].invoiceNo})"),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        commonTile(
                                                            text: 'Customer',
                                                            subText: value
                                                                .sellItemList[
                                                                    index]
                                                                .contact!
                                                                .name
                                                                .toString()),
                                                        const Gap(5),
                                                        commonTile(
                                                            text: 'Business',
                                                            subText: value
                                                                .sellItemList[
                                                                    index]
                                                                .contact!
                                                                .supplierBusinessName
                                                                .toString()),
                                                        const Gap(5),
                                                        commonTile(
                                                            text: 'Invoice No.',
                                                            subText:
                                                                '#${value.sellItemList[index].invoiceNo}'),
                                                        const Gap(5),
                                                        commonTile(
                                                            text: 'Date',
                                                            subText: DateFormat(
                                                                    'dd/MM/yyyy')
                                                                .format(DateTime.parse(value
                                                                        .sellItemList[
                                                                            index]
                                                                        .transactionDate ??
                                                                    ""))),
                                                        const Gap(5),
                                                        commonTile(
                                                            text:
                                                                'Payment Status',
                                                            subText: value
                                                                    .sellItemList[
                                                                        index]
                                                                    .paymentStatus ??
                                                                ""),
                                                        const Gap(5),
                                                        commonTile(
                                                            text:
                                                                'Reference Number',
                                                            subText: value
                                                                    .sellItemList[
                                                                        index]
                                                                    .refNo ??
                                                                ""),
                                                        const Gap(5),
                                                        commonTile(
                                                            text: 'Amount',
                                                            subText: value
                                                                    .sellItemList[
                                                                        index]
                                                                    .roundOffAmount ??
                                                                ""),
                                                        const Gap(5),
                                                        commonTile(
                                                            text:
                                                                'Payment Method',
                                                            subText: value
                                                                    .sellItemList[
                                                                        index]
                                                                    .preferPaymentMethod ??
                                                                "")
                                                      ],
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                      child: const Text('Close'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: const Text('Print'),
                                                      onPressed: () {
                                                        Navigator.pop(
                                                              context);
                                                          _launchURL(value
                                                                  .sellItemList[
                                                                      index]
                                                                  .invoiceUrl ??
                                                              "");
                                                        },
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        color: Colors.pink),
                                  ],
                                  leadingActions: [
                                    SwipeAction(
                                        backgroundRadius: 20,
                                        title: "Print",
                                        onTap:
                                            (CompletionHandler handler) async {
                                              _launchURL(value.sellItemList[index]
                                                    .invoiceUrl ??
                                                "");
                                          },
                                        color: Colors.red),
                                    SwipeAction(
                                        backgroundRadius: 20,
                                        title: "Return",
                                        onTap:
                                            (CompletionHandler handler) async {
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                                          {
                                            return ReturnSellPage(
                                                  item:
                                                      value.sellItemList[index],
                                                  payline: value
                                                          .sellItemList[index]
                                                          .paymentLines?[0]
                                                          .transactionId ??
                                                      "");
                                            }));
                                        },
                                        color: Colors.amber),
                                  ],
                                  child: InkWell(
                                      onTap: () async {
                                        // showLoadingDialog(context: context);
                                        // await Provider.of<ListOfSellViewModel>(
                                        //         context,
                                        //         listen: false)
                                        //     .getSpecifiedContact(
                                        //         contactId: value
                                        //                 .sellItemList[index]
                                        //                 .contactId ??
                                        //             "",
                                        //         context: context);
                                        // var name =
                                        //     Provider.of<ListOfSellViewModel>(
                                        //             context,
                                        //             listen: false)
                                        //         .specifiedContactList[0]
                                        //         .name;
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Sell Details(Invoice No.${value.sellItemList[index].invoiceNo})"),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  commonTile(
                                                      text: 'Customer Name',
                                                      subText: value
                                                          .sellItemList[index]
                                                          .contact!
                                                          .name
                                                          .toString()),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Payment Status',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .paymentStatus ??
                                                          ""),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Date',
                                                      subText: value
                                                          .sellItemList[index]
                                                          .transactionDate
                                                          .toString()),
                                                  const Gap(5),
                                                  Divider(),
                                                  Utils.boldSubHeadingText(
                                                      text: "Products:"),
                                                  Gap(5),
                                                  commonTile(
                                                      text: 'Product Name',
                                                      subText: 'hh'),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Quantity',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .sellLines?[0]
                                                              .quantity ??
                                                          ""),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Price',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .sellLines?[0]
                                                              .unitPrice ??
                                                          ""),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Subtotal',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .finalTotal ??
                                                          ""),
                                                  Divider(),
                                                  Utils.boldSubHeadingText(
                                                      text: "Payment info:"),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Date',
                                                      subText: value
                                                          .sellItemList[index]
                                                          .transactionDate
                                                          .toString()),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Reference No',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .refNo ??
                                                          ""),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Amount',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .totalAmountRecovered ??
                                                          ""),
                                                  const Gap(5),
                                                  commonTile(
                                                      text: 'Payment Mode',
                                                      subText: value
                                                              .sellItemList[
                                                                  index]
                                                              .paymentLines?[0]
                                                              .method ??
                                                          ""),
                                                  const Gap(5),
                                                ],
                                            ),
                                            actions:[

                                              FlatButton(
                                                child: const Text("Close"),
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              FlatButton(
                                                child: const Text("Print Invoice"),

                                                onPressed: () async {
                                                  _launchURL(value
                                                            .sellItemList[index]
                                                            .invoiceUrl ??
                                                        "");
                                                  },
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      height: 60,
                                      width: Utils.getWidth(context),
                                      decoration: BoxDecoration(
                                        color: AppColor.grey2,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: AppColor.grey2),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Utils.mediumHeadingText(
                                                    text: value.sellItemList[index].invoiceNo,
                                                    color: AppColor.dark_green),
                                              )),
                                          Utils.customVerticalDivider(),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 20,
                                                width: 40,
                                                margin: const EdgeInsets.all(6),
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 1, horizontal: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  color: value.sellItemList[index]
                                                      .paymentStatus ==
                                                      'paid'
                                                      ? AppColor.green
                                                      .withOpacity(0.4)
                                                      : AppColor.orange
                                                      .withOpacity(0.4),
                                                ),
                                                child: Center(
                                                  child: Utils.mediumHeadingText(
                                                      text: value.sellItemList[index]
                                                          .paymentStatus ==
                                                          'paid'
                                                          ? 'Paid'
                                                          : 'Due',
                                                      color: AppColor.black),
                                                )),
                                          ),
                                          Utils.customVerticalDivider(),
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                  child: Provider.of<
                                                                    ListOfSellViewModel>(
                                                                context,
                                                                listen: false)
                                                            .sellItemList[index]
                                                            .paymentLines!
                                                            .isNotEmpty
                                                        ? Utils.mediumHeadingText(
                                                            text: value
                                                                .sellItemList[
                                                                    index]
                                                                .paymentLines?[
                                                                    0]
                                                                .method,
                                                            color: AppColor
                                                                .dark_green)
                                                        : Utils
                                                            .mediumHeadingText(
                                                                text: ""))),
                                          Utils.customVerticalDivider(),
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Utils.mediumHeadingText(
                                                    text: value.sellItemList[index].finalTotal,
                                                    color: AppColor.dark_green),
                                              )),
                                          Utils.customVerticalDivider(),
                                          Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Utils.mediumHeadingText(
                                                          // text: value.sellItemList[index].id,
                                                          text: value
                                                                  .sellItemList[
                                                                      index]
                                                                  .contact
                                                                  ?.name ??
                                                              '',
                                                          textAlign:
                                                              TextAlign.center,
                                                          color: AppColor
                                                              .dark_green),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      },
                    ),
                  ],
                );
              },)
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  commonTile({required String text, required String subText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.mediumHeadingText(text: "${text}:"),
        const Gap(5),
        Expanded(
            child: Utils.regularHeadingText(
                text: subText, textOverflow: TextOverflow.clip))
      ],
    );
  }

  showDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          bool isSubcribed = false;
          String startDate = '';
          String endDate = '';
          return Consumer<PosPageViewModel>(
            builder: (BuildContext context, value, Widget? child) {
              return StatefulBuilder(builder: (context, setState) {
                return Dialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  insetPadding: const EdgeInsets.only(left: 10, right: 10),
                  //this right here
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.light_white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 10, bottom: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10),
                            Utils.boldSubHeadingText(
                                text: 'View Payment', textSize: 20),
                            const Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                          text: UtilStrings.businessLocation),
                                      const Gap(5),
                                      Container(
                                        height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: TypeAheadField(
                                            suggestionsBoxDecoration:
                                                SuggestionsBoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    elevation: 5),
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
                                              // textAlignVertical: TextAlignVertical.top,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 4),
                                                border: InputBorder.none,
                                                hintText: "all",
                                              ),
                                              controller: locationController,
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              return StateService
                                                  .getLocationSuggestions(
                                                      pattern, context);
                                            },
                                            transitionBuilder: (context,
                                                suggestionsBox, controller) {
                                              return suggestionsBox;
                                            },
                                            itemBuilder:
                                                (context, Location suggestion) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1))),
                                                child: ListTile(
                                                  title: Text(suggestion.name ==
                                                          'all'
                                                      ? "all"
                                                      : '${suggestion.name} (${suggestion.locationId})'),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected:
                                                (Location suggestion) {
                                              locationController.text =
                                                  suggestion.id.toString();
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                          text: UtilStrings.paymentStatus),
                                      const Gap(5),
                                      Container(
                                        height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: TypeAheadField(
                                            suggestionsBoxDecoration:
                                                SuggestionsBoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    elevation: 5),
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
                                              // textAlignVertical: TextAlignVertical.top,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 4),
                                                border: InputBorder.none,
                                                hintText: "all",
                                              ),
                                              controller:
                                                  paymentStatusController,
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              return await FilterServices
                                                  .getPaymentSuggestion(
                                                      pattern);
                                            },
                                            transitionBuilder: (context,
                                                suggestionsBox, controller) {
                                              return suggestionsBox;
                                            },
                                            itemBuilder: (context, suggestion) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1))),
                                                child: ListTile(
                                                  title: Text(
                                                      suggestion.toString()),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected: (suggestion) {
                                              paymentStatusController.text =
                                                  suggestion.toString();
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(text: UtilStrings.customer),
                                      const Gap(5),
                                      Container(
                                        height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: TypeAheadField(
                                            suggestionsBoxDecoration:
                                                SuggestionsBoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    elevation: 5),
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
                                              // textAlignVertical: TextAlignVertical.top,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 4),
                                                border: InputBorder.none,
                                                hintText: "all",
                                              ),
                                              controller: customerController,
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              return StateService
                                                  .getSuggestions(
                                                      pattern, context);
                                            },
                                            transitionBuilder: (context,
                                                suggestionsBox, controller) {
                                              return suggestionsBox;
                                            },
                                            itemBuilder:
                                                (context, User suggestion) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1))),
                                                child: ListTile(
                                                  title: Text(suggestion.name ==
                                                          'all'
                                                      ? 'all'
                                                      : '${suggestion.name} (${suggestion.id})'),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected:
                                                (User suggestion) {
                                              customerController.text =
                                                  suggestion.id.toString();
                                            }),
                                      ),
                                      // commonDropDown(),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(text: UtilStrings.user),
                                      const Gap(5),
                                      Container(
                                        height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: TypeAheadField(
                                            suggestionsBoxDecoration:
                                                SuggestionsBoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    elevation: 5),
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
                                              // textAlignVertical: TextAlignVertical.top,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 4),
                                                border: InputBorder.none,
                                                hintText: "all",
                                              ),
                                              controller: userController,
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              return await FilterServices
                                                  .getUserSuggestion(pattern);
                                            },
                                            transitionBuilder: (context,
                                                suggestionsBox, controller) {
                                              return suggestionsBox;
                                            },
                                            itemBuilder: (context, suggestion) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1))),
                                                child: ListTile(
                                                  title: Text(
                                                      suggestion.toString()),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected: (suggestion) {
                                              userController.text =
                                                  suggestion.toString();
                                              userController.clear();
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                          text: UtilStrings.shippingStatus),
                                      const Gap(5),
                                      Container(
                                        height: 45,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: TypeAheadField(
                                            suggestionsBoxDecoration:
                                                SuggestionsBoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    elevation: 5),
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
                                              // textAlignVertical: TextAlignVertical.top,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.only(top: 4),
                                                border: InputBorder.none,
                                                hintText: "all",
                                              ),
                                              controller:
                                                  shippingStatusController,
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              return await FilterServices
                                                  .getShippingStatusSuggestion(
                                                      pattern);
                                            },
                                            transitionBuilder: (context,
                                                suggestionsBox, controller) {
                                              return suggestionsBox;
                                            },
                                            itemBuilder: (context, suggestion) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1))),
                                                child: ListTile(
                                                  title: Text(
                                                      suggestion.toString()),
                                                ),
                                              );
                                            },
                                            onSuggestionSelected: (suggestion) {
                                              shippingStatusController.clear();
                                              shippingStatusController.text =
                                                  suggestion.toString();
                                            }),
                                      ),
                                      const Gap(20),
                                    ],
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Gap(20),
                                        Row(
                                          children: <Widget>[
                                            Gap(20),
                                            commonText(
                                                text: UtilStrings.subScription),
                                            Gap(5),
                                            // InkWell(
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //         border: Border.all(color: AppColor.grey)
                                            //     ),
                                            //     width: 20,
                                            //     height: 20,
                                            //     child: isSubcribed == true ? Center(child: Icon(Icons.check,size: 20)) : Container(),
                                            //   ),
                                            //   onTap: (){
                                            //     setState(() {
                                            //       isSubcribed != isSubcribed;
                                            //       print("hello${isSubcribed}");
                                            //     });
                                            //   },
                                            // ),
                                            Checkbox(
                                                value: isSubcribed,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isSubcribed = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(text: UtilStrings.dateRange),
                                      const Gap(5),
                                      InkWell(
                                        onTap: () {
                                          showDialog<Widget>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: 200,
                                                  width: 200,
                                                  child: SfDateRangePicker(
                                                    backgroundColor:
                                                        AppColor.white,
                                                    showActionButtons: true,
                                                    onSelectionChanged:
                                                        (DateRangePickerSelectionChangedArgs
                                                            args) {
                                                      setState(() {
                                                        if (args.value
                                                            is PickerDateRange) {
                                                          _range =
                                                              '${DateFormat('dd/MM/yyyy').format(args.value.startDate)}'
                                                              '-'
                                                              '${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
                                                          startDate = DateFormat(
                                                                  'yyyy/MM/dd')
                                                              .format(args.value
                                                                  .startDate);
                                                          endDate = DateFormat(
                                                                  'yyyy/MM/dd')
                                                              .format(args.value
                                                                      .endDate ??
                                                                  args.value
                                                                      .startDate);
                                                          print(
                                                              "HELLO RANGE${_range}");
                                                          print(
                                                              "HELLO START${startDate}");
                                                          print(
                                                              "HELLO END${endDate}");
                                                        }
                                                      });
                                                    },
                                                    selectionMode:
                                                        DateRangePickerSelectionMode
                                                            .range,
                                                    // initialSelectedRange: PickerDateRange(
                                                    //     DateTime.now().subtract(const Duration(days: 4)),
                                                    //     DateTime.now().add(const Duration(days: 3))),
                                                    //       showActionButtons: true,
                                                    onCancel: () {
                                                      Navigator.pop(context);
                                                    },
                                                    onSubmit: (val) {
                                                      Navigator.pop(context);
                                                      print("HELLO${_range}");
                                                    },
                                                  ),
                                                );
                                              });
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 45,
                                          width: 170,
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color: AppColor.grey2,
                                                offset: Offset(-1.0, 10),
                                                blurRadius: 15,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppColor.grey, width: 1),
                                          ),
                                          child: Utils.mediumHeadingText(
                                              text: _range,
                                              color: AppColor.grey),
                                        ),
                                      ),
                                      // Container(
                                      //     child: SfDateRangePicker(
                                      //       onSelectionChanged: _onSelectionChanged,
                                      //       selectionMode: DateRangePickerSelectionMode.range,
                                      //       initialSelectedRange: PickerDateRange(
                                      //           DateTime.now().subtract(const Duration(days: 4)),
                                      //           DateTime.now().add(const Duration(days: 3))),
                                      //       showActionButtons: true,
                                      //     ),
                                      // )
                                      // Container(
                                      //   height: 50,
                                      //   child: InkWell(
                                      //     onTap: ()
                                      //     async {
                                      //       final picked = await showDateRangePicker(
                                      //         context: context,
                                      //         lastDate: endDate,
                                      //         firstDate: startDate,
                                      //       );
                                      //       if (picked != null) {
                                      //         print('Picked --> $startDate');
                                      //         print('Picked --> $endDate');
                                      //         setState(() {
                                      //           startDate = picked.start;
                                      //           endDate = picked.end;
                                      //         });
                                      //       }
                                      //     },
                                      //     child: Container(
                                      //       alignment: Alignment.center,
                                      //       height: 40,
                                      //       width: 170,
                                      //       decoration: BoxDecoration(
                                      //         boxShadow: const [
                                      //           BoxShadow(
                                      //             color: AppColor.grey2,
                                      //             offset: Offset(-1.0, 10),
                                      //             blurRadius: 15,
                                      //             spreadRadius: 1,
                                      //           ),
                                      //         ],
                                      //         color: AppColor.white,
                                      //         borderRadius: BorderRadius.circular(15),
                                      //         border: Border.all(
                                      //             color: AppColor.grey, width: 1),
                                      //       ),
                                      //       child: Utils.mediumHeadingText(
                                      //           text: '${startDate} - ${endDate}',
                                      //           color: AppColor.grey),
                                      //     ),
                                      //   ),
                                      // ),
                                      // commonDropDown(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(30),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  print(
                                      "location is${locationController.text}");
                                  print(
                                      "contact id is${customerController.text}");
                                  print(
                                      "PAYMENT STATUS IS${paymentStatusController.text}");
                                  print(
                                      "SHIPPING STATUS IS${shippingStatusController.text}");
                                  print("IS SUBSCRIBED IS$isSubcribed");
                                  print("start date ius$startDate");
                                  print("end date is$endDate");
                                  print("subscripton is $isSubcribed");
                                  Provider.of<ListOfSellViewModel>(context,
                                          listen: false)
                                      .filterSellList(
                                    locationId: locationController.text == 'all'
                                        ? ''
                                        : locationController.text,
                                    contactId: customerController.text == 'all'
                                        ? ''
                                        : customerController.text,
                                    paymentStatus:
                                        paymentStatusController.text == 'all'
                                            ? ''
                                            : paymentStatusController.text,
                                    ShippingStatus:
                                        shippingStatusController.text == 'all'
                                            ? ''
                                            : shippingStatusController.text,
                                    IsSubscribed:
                                        isSubcribed == true ? '1' : '0',
                                    startDate: startDate,
                                    endDate: endDate,
                                  );
                                  startDate = '';
                                  endDate = '';
                                  locationController.clear();
                                  customerController.clear();
                                  paymentStatusController.clear();
                                  shippingStatusController.clear();
                                  Navigator.pop(context);
                                });
                              },
                              child: const CustomButton(title: 'Apply'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          );
        });
  }

  Widget commonText({required text}) {
    return Utils.mediumHeadingText(
        text: '${text}:',
        color: const Color(0xff1a237e),
        fontWeight: FontWeight.bold);
  }

  Widget commonDropDown() {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColor.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          icon: const Icon(
            Icons.expand_more_outlined,
            size: 20,
          ),
          elevation: 16,
          style: const TextStyle(color: AppColor.grey),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Cash', 'Card', 'Cheque', 'Bank Transfer']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Utils.mediumHeadingText(text: value, color: AppColor.grey),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      height: 400,
      color: AppColor.green,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 66.0 + 16.0 * 12,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          const Text(
            'ttttttt',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'description',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              color: Colors.amber,
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child: const Text(
                'buttonText',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {}
}

class FilterServices {
  static final List<String> paymentStatus = [
    'all',
    'Paid',
    'Due',
    'partial',
    'OverDue'
  ];
  static final List<String> shippingStatusList = [
    'all',
    'Ordered',
    'Packed',
    'Shipped',
    'Delivered',
    'Cancelled'
  ];
  static final List<String> userList = [
    'all',
    'Mr Admin user',
    'demo',
    'mr demo test'
  ];

  static List<String> getPaymentSuggestion(String query) {
    List<String> paymetstatuses = [];
    paymetstatuses.addAll(paymentStatus);
    paymetstatuses
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return paymetstatuses;
  }

  static List<String> getUserSuggestion(String query) {
    List<String> userlists = [];
    userlists.addAll(userList);
    userlists.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return userlists;
  }

  static List<String> getShippingStatusSuggestion(String query) {
    List<String> shippingstatuses = [];
    shippingstatuses.addAll(shippingStatusList);
    shippingstatuses
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return shippingstatuses;
  }
}
