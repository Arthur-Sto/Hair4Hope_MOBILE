import 'package:flutter/material.dart';
import 'package:iam_app/pages/main_page.dart';
import 'package:iam_app/pages/presentation_page.dart';
import 'package:iam_app/pages/presentation_page2.dart';
import 'package:iam_app/pages/welcome_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/presentation': (context) => const PresentationPage(),
        '/presentation2': (context) => const PresentationPage2(),
        '/main': (context) => const MainPage(),
      },
    );
  }
}
