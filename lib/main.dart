import 'package:call_1807/data/mock.dart';
import 'package:call_1807/pages/detail_page.dart';
import 'package:call_1807/pages/home_page.dart';
import 'package:call_1807/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) {
          if (MockData.logedUser == null) {
            return LoginPage();
          }
          return HomePage();
        },
        DetailPage.routeName: (context) {
          if (MockData.logedUser == null) {
            return LoginPage();
          }
          return DetailPage();
        },
      },
    );
  }
}
