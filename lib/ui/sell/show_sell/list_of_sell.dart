import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:gap/gap.dart';
import 'package:pos/ui/sell/return_sell/return_sell_page.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'list_of_sell_view_model.dart';

class ListOfSellPage extends StatefulWidget {
  const ListOfSellPage({Key? key}) : super(key: key);

  @override
  _ListOfSellPageState createState() => _ListOfSellPageState();
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
    return Scaffold(
      appBar: Utils.customAppBar(
          text: UtilStrings.sellList,
          icon: Icons.info_outlined,
          onTap: () {
            Navigator.pop(context);
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Consumer<ListOfSellViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: value.sellItemList.length,
              itemBuilder: (BuildContext context, int index) {
                if (value.selllist != null) {
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColor.light_white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('ID :->'),
                                  Text(value.sellItemList[index].id),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Business ID :->'),
                                  Text(value.sellItemList[index].businessId),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Final Amount :->'),
                                  Text(value.sellItemList[index].finalTotal),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print(
                                    'Your nae ${value.sellItemList[index].invoiceUrl}');
                                _launchURL(context,value.sellItemList[index].invoiceUrl);
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (BuildContext context) {
                                //   return OpenPdf(
                                //     url: value.sellItemList[index].invoiceUrl,
                                //   );
                                // }));
                                // _launchURL(value.sellItemList[index].invoiceUrl);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Utils.smallHeadingText(
                                    text: 'View Invoice',
                                    color: AppColor.white),
                              ),
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return ReturnSellPage(
                                    item: value.sellItemList[index],
                                  );
                                }));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Utils.smallHeadingText(
                                    text: 'Return Sale', color: AppColor.white),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  Future<void> _launchURL(BuildContext context,String url) async {
    final theme = Theme.of(context);
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: theme.primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: theme.primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

}

class OpenPdf extends StatefulWidget {
  final String url;
  const OpenPdf({Key? key, required this.url}) : super(key: key);

  @override
  State<OpenPdf> createState() => _OpenPdfState();
}

class _OpenPdfState extends State<OpenPdf> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        // initialUrl:
            // 'https://flutter.dev',
initialUrl: 'https://erpx.shajan-sa.com/invoice/965aeb4b59a5085f8f5414d4405d766e',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          // _toasterJavascriptChannel(context),
        },
      ),
    );
  }
  Future<void> _launchURL(BuildContext context) async {
    final theme = Theme.of(context);
    try {
      await launch(
        'https://flutter.dev',
        customTabsOption: CustomTabsOption(
          toolbarColor: theme.primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: theme.primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
