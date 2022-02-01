import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos/localization/app_localization.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_view_model.dart';
import 'package:pos/ui/auth/link/add_secret_key_page.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/ui/sell/return_sell/return_sell_view_model.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell_view_model.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/constants/app_constants.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:pos/utils/utils.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'localization/language_constrants.dart';
import 'utils/preference_utils.dart';

final GlobalKey<NavigatorState> nav = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await inits();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<LoginViewModel>()),
    ChangeNotifierProvider(create: (context) => di.sl<ListOfSellViewModel>()),
    ChangeNotifierProvider(create: (context) => di.sl<AddNewContactViewModel>()),
            ChangeNotifierProvider(create: (context) => di.sl<PosPageViewModel>()),
            ChangeNotifierProvider(create: (context) => di.sl<ReturnSellViewModel>()),
          ],
          child: const MyApp()
      ));
}


class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription connectivitySubscription;

  late ConnectivityResult _previousResult;

  var subToken = '';

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<bool> check1() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // clear();
    AppConstant.token = getString(PrefKeyConstants.token);
    AppConstant().baseUrl = getString(PrefKeyConstants.baseUrl);
    print("VALUE OF TOKEN $subToken");
    print("VALUE OF TOKEN ${subToken.runtimeType}");
    print("VALUE OF BASE URL IS${AppConstant().baseUrl}");
    check().then((intenet) {
      if (intenet) {
      } else {
        final context = nav.currentState!.overlay!.context;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Center(
                  child: Icon(Icons.wifi_off,
                      size: 50, color: AppColor.primaryColor),
                ),
                contentPadding: const EdgeInsets.all(20),
                content: const Text(
                  'Slow or no internet conection \n Check your connection',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  SizedBox(
                    width: Utils.getWidth(context),
                    child: Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: AppColor.primaryColor,
                        onPressed: () {
                          check1().then((internet) {
                            if (internet) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                              // print('tap');
                            } else {}
                          });
                        },
                        child: const Text(
                          'Reconnect',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
      }
    });

    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        final context = nav.currentState!.overlay!.context;
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) {
              return const AlertDialog(
                title: Center(
                  child: Icon(
                    Icons.wifi_off,
                    size: 50,
                    color: AppColor.primaryColor,
                  ),
                ),
                contentPadding: EdgeInsets.all(20),
                content: Text(
                  'Slow or no internet conection \n Check your connection',
                  textAlign: TextAlign.center,
                ),
              );
            });
      } else if (_previousResult == ConnectivityResult.none) {
        nav.currentState!.pop();
        // nav.currentState.push(
        //     MaterialPageRoute(builder: (BuildContext _) => HomeActivity()));
      }
      _previousResult = connectivityResult;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    connectivitySubscription.cancel();
  }

  late Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS App',
      navigatorKey: nav,
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // locale: _locale,
      supportedLocales: const [
        Locale("en", "US"),
        Locale("ar", "SA"),
      ],
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      // home: getString(PrefKeyConstants.TOKEN).isEmpty? ChooseLanguagePage(isLanguage: false,) : HomePage(),
      //     // home: getString(PrefKeyConstants.token).isEmpty

      home: AppConstant.token.isEmpty
          ? const AddSecretKey()
          : const HomePage(),
      // home: AddSecretKey(),
      // home:   LinkPage(),
    );
  }
}