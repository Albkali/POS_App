import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/ui/auth/login/login_view_model.dart';
import 'package:pos/ui/main_container_screen/home_page.dart';
import 'package:pos/ui/sell/show_sell/list_of_sell_view_model.dart';
import 'package:pos/utils/constants/preference_key_constants.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;
import 'utils/preference_utils.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await di.init();
  await inits();
  runApp(MultiProvider(
    providers: [
    ChangeNotifierProvider(create: (context) => di.sl<LoginViewModel>()),
    ChangeNotifierProvider(create: (context) => di.sl<ListOfSellViewModel>()),
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