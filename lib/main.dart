import 'package:flutter/material.dart';

import 'layout/home_layout.dart';
import 'screens/create_account/create_account.dart';
import 'shared/styles/my_theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat_app',
      debugShowCheckedModeBanner: false,
      initialRoute: CreateAccounts.routeName,
      routes: {
        HomeLayout.routeName: (c) => HomeLayout(),
        CreateAccounts.routeName:(c)=>CreateAccounts(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode:ThemeMode.light ,
    );
  }
}
