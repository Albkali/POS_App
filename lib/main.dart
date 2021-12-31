import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos/localization/app_localization.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_view_model.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/pos/pos_page_view_model.dart';
import 'package:pos/ui/sell/return_sell/return_sell_view_model.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell_view_model.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'localization/language_constrants.dart';
import 'utils/preference_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  await inits();
  runApp(MultiProvider(
    providers: [
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
        this._locale = locale;
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
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: _locale,
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
      home: getString(PrefKeyConstants.TOKEN).isEmpty? LoginPage() : HomePage(),
      // home:   LoginPage(),
      // home:   LinkPage(),
    );
  }
}