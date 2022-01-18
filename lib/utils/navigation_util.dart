// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pos/ui/auth/login/login_page.dart';
// import 'package:pos/ui/sell/show_sell/list_of_sell.dart';
//
// import 'constants/navigation_route_constants.dart';
//
// class NavigationUtils {
//   GlobalKey<NavigatorState> globalStateKey = GlobalKey();
//
//   Object generateRoute(RouteSettings settings) {
//     final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
//
//     switch (settings.name) {
//       case routeLogin:
//         return const LoginPage();
//       case routeListOfSell:
//         return const ListOfSellPage();
//       default:
//         return const ErrorRoute(title: " Unimplemented...");
//     }
//   }
//
//
//
//   void pushReplacement(String routeName, {Object? arguments}) {
//     globalStateKey.currentState
//         ?.pushReplacementNamed(routeName, arguments: arguments);
//   }
//
//   Future<dynamic>? push(String routeName, {Object? arguments}) {
//     return globalStateKey.currentState
//         ?.pushNamed(routeName, arguments: arguments);
//   }
//
//   void pop({dynamic args}) {
//     globalStateKey.currentState?.pop(args);
//   }
//
//   Future<dynamic>? pushAndRemoveUntil(String routeName, {Object? arguments}) {
//     return globalStateKey.currentState?.pushNamedAndRemoveUntil(
//         routeName, (route) => false,
//         arguments: arguments);
//   }
//
//   Future<dynamic>? pushAndRemoveUntilRoute(String routeName,
//       {Object? arguments, String? lastRoute = routeHome}) {
//     return globalStateKey.currentState?.pushNamedAndRemoveUntil(
//         routeName, ModalRoute.withName(lastRoute ?? "/"),
//         arguments: arguments);
//   }
//
// }
//
//
// class ErrorRoute extends StatelessWidget {
//   final String title;
//   const ErrorRoute({Key? key,required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(
//         appBar: AppBar(title: const Text('Error')),
//         body: Center(child: Text(title)));
//   }
// }
//
//
