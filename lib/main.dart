import 'package:flutter/material.dart';
import 'package:pos/ui/add_new_contact/add_new_contact_page.dart';
import 'package:pos/ui/auth/link/link_page.dart';
import 'package:pos/ui/auth/login/login_page.dart';
import 'package:pos/ui/sell/return_sell/return_sell_page.dart';
import 'package:pos/ui/view_payment/view_payment_page.dart';

import 'ui/sell/show_sell/show_sell_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:   ReturnSellPage(),
    );
  }
}