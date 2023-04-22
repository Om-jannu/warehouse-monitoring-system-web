import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invsync/screens/loginPage.dart';
import 'package:invsync/widgets/themes.dart';

import 'screens/homepage.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');

  bool isLoggedIn = Hive.box('userBox').get('isLoggedIn', defaultValue: false);
  runApp(myApp(isLoggedIn: isLoggedIn));
}

class myApp extends StatelessWidget {
  final bool isLoggedIn;
  myApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator"); //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        // home: HomePage(),
        // home: MyPhone(),
        home: isLoggedIn ? const HomePage() : const LoginPage()
        // initialRoute: isLoggedIn ? HomePage() : LoginPage();
        );
  }
}
