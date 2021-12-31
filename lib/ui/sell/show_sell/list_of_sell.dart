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


import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:gap/gap.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:pos/widgets/small_custom_button_with_icon.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'list_of_sell_view_model.dart';

class ListOfSellPage extends StatefulWidget {
  const ListOfSellPage({Key? key}) : super(key: key);

  @override
  State<ListOfSellPage> createState() => _ListOfSellPageState();
}

class _ListOfSellPageState extends State<ListOfSellPage> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    await Provider.of<ListOfSellViewModel>(context, listen: false).sellList();
  }

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
                              Text('List of Sell',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20),
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
                                color: AppColor.dark_green,textAlign: TextAlign.center,fontWeight: FontWeight.w700)),
                        Utils.customVerticalDivider(),
                        Expanded(
                            child: Utils.mediumHeadingText(
                                text: 'Payment status',
                                color: AppColor.dark_green,textAlign: TextAlign.center,fontWeight: FontWeight.w700)),
                        Utils.customVerticalDivider(),
                        Expanded(
                            child: Utils.mediumHeadingText(
                                text: 'Payment method',
                                color: AppColor.dark_green,textAlign: TextAlign.center,fontWeight: FontWeight.w700)),
                        Utils.customVerticalDivider(),
                        Expanded(
                            child: Utils.mediumHeadingText(
                                text: 'Total amount',
                                color: AppColor.dark_green,textAlign: TextAlign.center,fontWeight: FontWeight.w700)),
                        Utils.customVerticalDivider(),
                        Expanded(
                            child: Utils.mediumHeadingText(
                                text: 'Customer name',
                                color: AppColor.dark_green,textAlign: TextAlign.center,fontWeight: FontWeight.w700)),
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
                                      title: "Print",
                                      onTap: (CompletionHandler handler) async {
                                        _launchURL(value.sellItemList[index].invoiceUrl);
                                      },
                                      color: Colors.red),
                                  SwipeAction(
                                      title: "Add",
                                      onTap: (CompletionHandler handler) async {
                                      },
                                      color: Colors.blue),
                                  SwipeAction(
                                      title: "View",
                                      onTap: (CompletionHandler handler) async {
                                      },
                                      color: Colors.pink),
                                ],
                                leadingActions: [
                                  SwipeAction(
                                      title: "Print",
                                      onTap: (CompletionHandler handler) async {
                                        _launchURL(value.sellItemList[index].invoiceUrl);
                                      },
                                      color: Colors.red),
                                  SwipeAction(
                                      title: "Add",
                                      onTap: (CompletionHandler handler) async {
                                      },
                                      color: Colors.blue),
                                  SwipeAction(
                                      title: "View",
                                      onTap: (CompletionHandler handler) async {
                                      },
                                      color: Colors.pink),
                                ],
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                                  height: 50,
                                  width: Utils.getWidth(context),
                                  decoration: BoxDecoration(
                                    color: AppColor.grey2,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                    Border.all(width: 1, color: AppColor.grey2),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Utils.mediumHeadingText(
                                                text: value.sellItemList[index].id,
                                                color: AppColor.dark_green),
                                          )),
                                      Utils.customVerticalDivider(),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            margin: const EdgeInsets.all(6),
                                            padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: value.sellItemList[index].paymentStatus == 'paid'? AppColor.orange.withOpacity(0.4) : AppColor.green.withOpacity(0.4),
                                            ),
                                            child: Utils.mediumHeadingText(
                                                text: value.sellItemList[index].paymentStatus == 'paid'? 'Paid' :'Unpaid',
                                                color: AppColor.black)),
                                      ),
                                      Utils.customVerticalDivider(),
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Utils.mediumHeadingText(
                                                text: value.sellItemList[index].payTermType,
                                                color: AppColor.dark_green),
                                          )),
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
                                                text: value.sellItemList[index].customerGroupId,
                                                color: AppColor.dark_green),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    },

                  ),

                ],
              ),
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
}
