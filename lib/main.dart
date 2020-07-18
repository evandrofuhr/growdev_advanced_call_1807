import 'package:call_1807/data/mock_data.dart';
import 'package:call_1807/pages/detail/detail_page.dart';
import 'package:call_1807/pages/edit/edit_page.dart';
import 'package:call_1807/pages/home/home_page.dart';
import 'package:call_1807/pages/items/items_page.dart';
import 'package:call_1807/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
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
        ItemsPage.routeName: (context) {
          if (MockData.logedUser == null) {
            return LoginPage();
          }
          return ItemsPage();
        },
        EditPage.routeName: (context) {
          if (MockData.logedUser == null) {
            return LoginPage();
          }
          return EditPage();
        },
      },
    );
  }
}
