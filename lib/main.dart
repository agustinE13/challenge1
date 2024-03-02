import 'package:challenge_app/pages/home_page.dart';
import 'package:challenge_app/pages/onboard_screen.dart';
import 'package:challenge_app/pages/splash_screen.dart';
import 'package:challenge_app/settings/app_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return ValueListenableBuilder(
      valueListenable: AppValueNotifier.banTheme,
      builder: (context, value, child) {
        return MaterialApp(
          theme: value
              ? ThemeData.dark()
              : ThemeData
                  .light(), //value?ThemeApp.DarkTheme(context):ThemeApp.lightTheme(context),
          home: const SplashScreen(),
          routes: {
            "/onboard": (BuildContext context) => const onBoardScreen(),
            "/main": (BuildContext context) => const HomePageMotors(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
