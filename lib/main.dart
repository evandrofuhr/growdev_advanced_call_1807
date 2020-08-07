import 'package:call_1807/pages/detail/detail_page.dart';
import 'package:call_1807/pages/edit/edit_page.dart';
import 'package:call_1807/pages/home/home_page.dart';
import 'package:call_1807/pages/items/items_page.dart';
import 'package:call_1807/pages/login/login_page.dart';
import 'package:call_1807/services/app_state_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appStateRepository = AppStateRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) {
          return FutureBuilder(
            future: _appStateRepository.getCurrent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data == null) {
                return LoginPage();
              }
              return HomePage();
            },
          );
        },
        DetailPage.routeName: (context) => DetailPage(),
        ItemsPage.routeName: (context) => ItemsPage(),
        EditPage.routeName: (context) => EditPage(),
      },
    );
  }
}
