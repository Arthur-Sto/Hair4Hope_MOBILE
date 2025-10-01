import 'package:flutter/material.dart';
import 'package:iam_app/pages/main_page.dart';
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
        '/main': (context) => const MainPage(),
      },
    );
  }
}
