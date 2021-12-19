import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos/di_container.dart';
import 'package:pos/repository/auth_repo.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_page.dart';
import 'package:pos/ui/auth/link/link_page.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/sell/return_sell/return_sell_page.dart';
import 'package:pos/ui/view_payment/view_payment_page.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'provider/sell_list_provider.dart';
import 'ui/sell/show_sell/show_sell_page.dart';

import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'di_container.dart' as di;
import 'utils/preference_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  await inits();
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SellListProvider>()),
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: getString(PrefKeyConstants.TOKEN).isEmpty?const LoginPage() : HomePage(),
      // home:   LoginPage(),
      // home:   LinkPage(),
    );
  }
}